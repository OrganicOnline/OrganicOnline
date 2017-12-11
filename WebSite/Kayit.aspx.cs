using GgDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Kayit : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        GetDistricts();
    }
    private void Temizle()
    {
        txtLoginUsername.Text = "";
        txtLoginPasswd.Text = "";
        txtAd.Text = "";
        txtKullaniciAdi.Text = "";
        txtPswd.Text = "";
        txtPswdAgain.Text = "";
        txtSoyad.Text = "";
        txtMail.Text = "";
        if (rbManav.Checked)
        {
            rbManav.Checked = false;
        }
        else
            rbMusteri.Checked = false;
        ddlIlce.SelectedIndex = 0;
        txtAdres.Text = "";
        txtTelefon.Text = "";
        fuFoto.TabIndex = 0;
    }

    private void GetDistricts()
    {
        ddlIlce.DataSource = GgDbProvider.GetDistrictList();
        ddlIlce.DataTextField = "DistrictName";
        ddlIlce.DataValueField = "ObjectID";
        ddlIlce.DataBind();
    }
    protected void lbLogin_Click(object sender, EventArgs e)
    {
        string usr = txtLoginUsername.Text;
        string pswd = txtLoginPasswd.Text;
        User result = GgDbProvider.GetUserByUsernameAndPassword(usr, pswd);
        if (result != default(User))
        {
            Session["Oturum"] = result;
            Response.Redirect("Urunlerr.aspx");
        }
        else
        {
            panelDanger.Visible = true;
            Session["Oturum"] = null;

        }
    }

    protected void btnGonder_Click(object sender, EventArgs e)
    {
        string ad, soyad, kullaniciAdi, sifre, eMail, adres, telefon, dukkanAd, resimYolu;
        ad = txtAd.Text;
        soyad = txtSoyad.Text;
        kullaniciAdi = txtKullaniciAdi.Text;
        sifre = txtPswd.Text;
        eMail = txtMail.Text;
        adres = txtAdres.Text;
        telefon = txtTelefon.Text;
        dukkanAd = txtDukkanAd.Text;
        resimYolu = null;
        if (rbManav.Checked == true)
        {
            try 
	        {	             
                if(fuFoto.HasFile)
                {
                    HttpPostedFile upload = fuFoto.PostedFile;
                    if(upload.ContentType.Contains("image") && upload.ContentLength < 1000000000)
                    {
                        Guid id = Guid.NewGuid();
                        resimYolu = Server.MapPath(string.Format("manavlar/{0}.jpg", id));
                    }
                    else{
                        //Çok büyük bla bla
                    }
                }
                else{
                    // Geçerli bir dosya yükleyin bla bla
                }
                 
	        }
	        catch (Exception ex)
	        {
		        Response.Write("Hata oldu resim yüklenirken./n" + ex.InnerException);
	        }
            Response.Write(resimYolu);
            int UserID = GgDbProvider.AddUser(ad, soyad, kullaniciAdi, sifre, eMail, 0);
            int DistrictID = Convert.ToInt32(ddlIlce.SelectedValue); //Bir şey seçmeyince patlar dikkat et
            GgDbProvider.AddSupplier(UserID, DistrictID, dukkanAd, adres, telefon, resimYolu);
            //Response.Write(resimYolu);
        }

        else if (rbMusteri.Checked == true)
        {
            GgDbProvider.AddUser(ad, soyad, kullaniciAdi, sifre, eMail, 1);
        }
        Temizle();
    }
}