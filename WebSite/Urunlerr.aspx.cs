using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Urunlerr : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        dlUrunler.DataSource = GgDbProvider.GetProductList();
        dlUrunler.DataBind();

        lblTopFiyat.Text = "0 TL";
        lblUrunSayisi.Text = "0 Ürün";
        btnSiparis.CssClass += "btn btn-default butonn disabled";
       
    }
    protected void dlUrunler_ItemCommand(object source, DataListCommandEventArgs e)
    {

        if (e.CommandName == "guncelle")
        {
            Response.Write(e.CommandArgument.ToString());
        }
    }
    protected void btnSepeteEkle_Click(object sender, EventArgs e)
    {
        btnSiparis.CssClass += "btn btn-default butonn";
        List<string> urunler;

        if (Session["Urunler"] != null)
        {
            urunler = Session["Urunler"] as List<string>;
            string eklenenUrun = lblUrunID.Value.ToString();
            urunler.Add(eklenenUrun);
            Session["Urunler"] = urunler;

            if (FarkliBirManavMi(urunler, eklenenUrun) == false)
            {
                int toplamUrunSayisi = Convert.ToInt32((Session["ToplamUrunSayisi"]));
                ++toplamUrunSayisi;
                Session["ToplamUrunSayisi"] = toplamUrunSayisi;
            }
            else
            {
                int i = urunler.Count();
                urunler.RemoveAt(i - 1);
                Session["Urunler"] = urunler;
                // UYARI DA YAZ BURAYA
            }



        }
        else
        {
            urunler = new List<string>();
            urunler.Add(lblUrunID.Value.ToString());
            Session["Urunler"] = urunler;
            Session["ToplamUrunSayisi"] = 1;
        }


        double fiyat = Convert.ToDouble(hfToplamFiyat.Value);
        List<double> toplamFiyat = new List<double>();

        //if (Session["ToplamFiyat"] != null)
        //{
        //    double toplamFiyat = Convert.ToDouble(Session["ToplamFiyat"]);
        //    toplamFiyat += fiyat;
        //    Session["ToplamFiyat"] = toplamFiyat;

        //}
        if (Session["ToplamFiyat"] != null)
        {
            toplamFiyat = Session["ToplamFiyat"] as List<double>;
            toplamFiyat.Add(fiyat);
            Session["ToplamFiyat"] = toplamFiyat;

        }

        else
        {
            toplamFiyat.Add(fiyat);
            Session["ToplamFiyat"] = toplamFiyat;

        }
        double toplam = ToplamUrunFiyatiniHesapla(toplamFiyat);
        lblSayi.Text = Session["ToplamUrunSayisi"].ToString();
        lblUrunSayisi.Text = Session["ToplamUrunSayisi"].ToString();
        lblUrunSayisi.Text += " " + "Ürün";

        lblTopFiyat.Text = toplam.ToString();
        lblTopFiyat.Text += " " + "TL";

        txtMiktar.Text = "";

    }
    protected double ToplamUrunFiyatiniHesapla(List<double> toplamFiyat)
    {
        double x = 0;
        foreach (double item in toplamFiyat)
        {
            x += item;
        }
        return x;
    }

    protected bool FarkliBirManavMi(List<string> urunler, string eklenenUrun)
    {
        int lastItem = urunler.Count - 1;
        int karsılastırılacakUrun = Convert.ToInt32(urunler[lastItem - 1]);
        int eklenenUrunId = Convert.ToInt32(eklenenUrun);
        GgDB.Product p_1 = new GgDB.Product();
        GgDB.Product p_2 = new GgDB.Product();

        p_1 = GgDbProvider.Product.First(i => i.ObjectID == karsılastırılacakUrun);
        p_2 = GgDbProvider.Product.First(i => i.ObjectID == eklenenUrunId);


        if(p_1.Supplier.ObjectID == p_2.Supplier.ObjectID)
        {
            return false;
        }
        else
        {
            return true;
        }
    }
    protected void btnSiparis_Click(object sender, EventArgs e)
    {
        Response.Redirect("UrunSiparis.aspx");
    }
}