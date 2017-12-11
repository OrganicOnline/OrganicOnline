using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using GgDB;

public partial class UrunSiparis : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Oturum"] == null)
            {
                Session["URL"] = "siparis";
                Response.Redirect("Login.aspx");
            }
            UrunleriGetir();
            return;
        }
    }

    private void UrunleriGetir()
    {
        if (Session["Urunler"] == null || Session["urunler"] == null)
        {
            pBilgi.Visible = true;
            txtNot.Visible = false;
            txtAdres.Visible = false;
            btnOnayla.Visible = false;
            pnlPaymnet.Visible = false;
            return;
        }
        if (Session["Urunler"] != null)
        {
            List<GgDB.Product> urunler = new List<GgDB.Product>();

            urunler = UrunleriListeyeGoreDuzenle();
            if (urunler == null || urunler.Count == 0)
            {
                pBilgi.Visible = true;
                rptUrunler.Visible = false;
                Session.Remove("Urunler");
                Session.Remove("urunler");
                Session.Remove("ToplamFiyat");
                txtNot.Visible = false;
                txtAdres.Visible = false;
                btnOnayla.Visible = false;
                pnlPaymnet.Visible = false;
                return;
            }
            rptUrunler.DataSource = urunler;
            rptUrunler.DataBind();
        }
    }
    private void UrunleriGetir(List<GgDB.Product> urunler)
    {
        if (urunler.Count == 0)
        {
            pBilgi.Visible = true;
            rptUrunler.Visible = false;
            Session.Remove("Urunler");
            Session.Remove("urunler");
            Session.Remove("ToplamFiyat");
            txtNot.Visible = false;
            txtAdres.Visible = false;
            btnOnayla.Visible = false;
            pnlPaymnet.Visible = false;
            return;
        }
        rptUrunler.DataSource = urunler;
        rptUrunler.DataBind();
    }

    private List<GgDB.Product> UrunleriListeyeGoreDuzenle()
    {
        List<string> urunIDler = new List<string>();
        List<GgDB.Product> urunler = new List<GgDB.Product>();
        List<double> urunFiyatlar = new List<double>();
        int i = 0;
        int j = 0;
        urunIDler = Session["Urunler"] as List<string>;
        urunFiyatlar = Session["ToplamFiyat"] as List<double>;

        if (urunIDler == null || urunIDler.Count == 0)
        {
            return urunler;
        }
        while (i < urunFiyatlar.Count && j < urunIDler.Count)
        {
            double fiyat = urunFiyatlar.ElementAt(i);
            int id = Convert.ToInt32(urunIDler.ElementAt(j));
            urunler.Add(UrunBulById(id, fiyat));

            ++j;
            ++i;
        }
        Session["urunler"] = urunler;

        return urunler;
    }

    protected void rptUrunler_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "kaldir")
        {
            Response.Write("<script>alert('Bu ürünü sipariş listenizden kaldırmak istediğinize emin misiniz?');</script>");
            string productName = e.CommandArgument.ToString();
            List<GgDB.Product> urunler = new List<GgDB.Product>();
            urunler = Session["urunler"] as List<GgDB.Product>;
            //Response.Write(productName);
            var silinecek = urunler.Single(i => i.ProductName == productName);
            //Response.Write(silinecek);

            urunler.Remove(silinecek);
            Session["urunler"] = urunler;
            UrunleriGetir(urunler);
        }
    }
    protected void btnOnayla_Click(object sender, EventArgs e)
    {
        int paymentTypeId = 0;
        List<GgDB.Product> urunler = new List<GgDB.Product>();
        urunler = Session["urunler"] as List<GgDB.Product>;
        GgDB.Product p = new GgDB.Product();
        string fiyat;
        string kilo;
        string ad;
        int i = 0;
        string body = txtAdres.Text.Trim();
        body += " adresine istenilen sipariş şu şekildedir: \n \n";
        while (i < urunler.Count)
        {
            p = urunler[i];
            ad = p.ProductName;
            fiyat = p.Price.ToString();
            kilo = p.Quantity.ToString();
            body += "     " + ad + " ürününden ";
            body += kilo + " kg ";
            body += "(" + fiyat + " TL" + "),\n";
            ++i;
        }
        body += "\nEkli Notlar: " + txtNot.Text;
        body += "\nOrganic Online ekibi bol kazançlar diler.";
        string manavMail;
        manavMail = p.Supplier.User.E_mail;

        if (rb1.Checked)
            paymentTypeId = 1;
        if (rb2.Checked)
            paymentTypeId = 2;
        else if (rb3.Checked)
            paymentTypeId = 3;
        else
        {
            pBilgi.Visible = true;
            pBilgi.InnerText = "Lütfen ödeme tipini belirtiniz.";
            return;
        }

        //try
        //{
            OrderCode code = new OrderCode();
            GgDbProvider.AddToOrderCode(code);
            GgDbProvider.SaveChanges();
            User customer = Session["Oturum"] as User;
            if (customer == default(User))
                Response.Redirect("Login.aspx");
            foreach (Product item in urunler)
            {
                GgDbProvider.AddOrder(customer.ObjectID, item.ObjectID, 1, paymentTypeId, item.Quantity, txtAdres.Text.Trim(), txtNot.Text.Trim(), code.ObjectId);
            }
            GgDbProvider.SaveChanges();


            MailMessage mail = new MailMessage("online.green.grocer@gmail.com", manavMail);
            SmtpClient client = new SmtpClient();
            client.Port = 587;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = new System.Net.NetworkCredential("online.green.grocer@gmail.com", "ggdb1234");
            client.Host = "smtp.gmail.com";
            mail.Subject = "Ürün Siparişi";
            mail.Body = body;
            client.Send(mail);

            txtAdres.Text = "";
            txtNot.Text = "";
            Session.Remove("Urunler");
            Session.Remove("urunler");
            Session.Remove("ToplamFiyat");
            pBilgi.Visible = true;
            pBilgi.InnerText = code.ObjectId + " numaralı siparişiniz başarıyla gönderilmiştir. En yakın sürede adresinize ulaşacaktır.";
            rptUrunler.Visible = false;
            txtNot.Visible = false;
            txtAdres.Visible = false;
            btnOnayla.Visible = false;
            pnlPaymnet.Visible = false;



        //}
        //catch
        //{
        //    Response.Write("<script>alert('Sipariş gönderilirken bir hata oldu lütfen bir daha deneyiniz.');</script>");
        //    UrunleriGetir(urunler);
        //}



    }

    public GgDB.Product UrunBulById(int id, double fiyat)
    {
        GgDB.Product p = GgDbProvider.Product.Single(i => i.ObjectID == id);
        decimal f = Convert.ToDecimal(fiyat);
        p.Quantity = Convert.ToInt32(f / p.Price);
        p.Price = f;
        return p;
    }

    public List<string> ManavlariGetir(List<string> tekrarEdenListe)
    {
        List<string> sadelesmisListe = new List<string>();

        sadelesmisListe = tekrarEdenListe.Distinct().ToList();


        return sadelesmisListe;
    }
}