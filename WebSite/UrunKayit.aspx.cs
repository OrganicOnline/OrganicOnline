using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GgDB;
using System.IO;

public partial class _Default : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {


        if (IsPostBack)
        {
            return;
        }
        if (Session["liste"] != null)
        {
            ListeyiGetir();
        }
        else
        {
            pBilgi.Visible = true;
            btnKaydet.Visible = false;
        }
        KategoriGetir();
        
    }
    
    private void KategoriGetir()
    {
        rptKategori.DataSource = GgDbProvider.GetCategoryList();
        rptKategori.DataBind();
    }

    private void ListeyiGetir(Product p)
    {
        rptListe.DataSource = EklenenlerListesi(p);
        rptListe.DataBind();
        
    }
    private void ListeyiGetir()
    {
        List<Product> eklenenler = new List<Product>();
        eklenenler = Session["liste"] as List<Product>;
        if (Session["liste"] == null || eklenenler.Count == 0)
        {
            rptListe.Visible = false;
            btnKaydet.Visible = false;
            pBilgi.Visible = true;
        }
        else

            
        rptListe.DataSource = eklenenler;
        rptListe.DataBind();

    }

    public List<Product> EklenenlerListesi(Product p)
    {
        List<Product> eklenenler;
        if (Session["liste"] == null)
            eklenenler = new List<Product>();
        else
            eklenenler = Session["liste"] as List<Product>;
        eklenenler.Add(p);
        Session["liste"] = eklenenler;
        pBilgi.Visible = false;
        rptListe.Visible = true;
        btnKaydet.Visible = true;
        
        return eklenenler;
    }
    protected void rptKategori_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "categoryById")
        {
            int id;
            hfCategoryId.Value = (string)e.CommandArgument;
            id = Convert.ToInt32(hfCategoryId.Value);
         //   Response.Write(hfCategoryId.Value);
            spnTur.InnerText = GgDbProvider.Category.FirstOrDefault(c => c.ObjectID == id && c.Deleted == false).CategoryName;  
        }
    }
    protected void btnEkle_Click(object sender, EventArgs e)
    {
        string urunAd, resimYolu;
        int miktar, manavID, kategoriID;
        decimal fiyat;
        kategoriID = Convert.ToInt32(hfCategoryId.Value);

        urunAd = txtUrunAdi.Text;
        miktar = Convert.ToInt32(txtStok.Text);
        manavID = 0;
        fiyat = Convert.ToDecimal(txtFiyat.Text);
        resimYolu =null;

        try
        {
            if(fuUrunFoto.HasFile)
            {
                HttpPostedFile upload = fuUrunFoto.PostedFile;
                if (upload.ContentType.Contains("image") && upload.ContentLength < 1000000000)
                {
                    Guid ID = Guid.NewGuid();
                    File.Copy(upload.FileName, Path.Combine(@"urunResimler\", Path.GetFileName(upload.FileName)));
                    resimYolu = Server.MapPath(string.Format("urunResimler{0}.jpg", ID));
                }
                else
                {
                    //Çok büyük bla bla
                }
            }
            else
            {
                //Dosya yüklenemedi bla bla
            }
        }
        catch (Exception)
        {
            Response.Write("Resim yüklenirken hata oldu");
        }
        Product p = new GgDB.Product();

        p = Product.UrunOlustur(kategoriID, urunAd, miktar, fiyat, resimYolu);
        ListeyiGetir(p);
        Temizle();

    }

    private void Temizle()
    {
        txtFiyat.Text = "";
        txtStok.Text = "";
        txtUrunAdi.Text = "";
        spnTur.InnerText = "Ürün Türü";
    }
    protected void rptListe_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if(e.CommandName == "kaldir")
        {
            string productName =  e.CommandArgument.ToString();
            List<Product> eklenenler = new List<Product>();
            eklenenler = Session["liste"] as List<Product>;
            var silinecek =  eklenenler.Single(i => i.ProductName == productName); //aynı product name'e ait başka isim eklerse patlar dikkat et
            eklenenler.Remove(silinecek);
            ListeyiGetir();
        }
    }
    protected void btnKaydet_Click(object sender, EventArgs e)
    {
        var liste = Session["liste"] as List<Product>;
        int manavID = 0;
        if(liste != null)
        {
            foreach (var item in liste)
            {
                GgDbProvider.AddProduct(manavID, item);
            }
            // GgDbProvider.SaveChanges();
            urunKayit.Visible = true;
            //paragrafBilgi.InnerText = "Ürünleriniz başarıyla kaydedilmiştir.";
            Session.Remove("liste");
        }
        else
        {
            //paragrafBilgi.InnerText = "Listenizde ekli ürün olmadığı için hiçbir ürün eklenmedi.";
            urunKayit.Visible = false;
            Session.Remove("liste");

        }


    }


}