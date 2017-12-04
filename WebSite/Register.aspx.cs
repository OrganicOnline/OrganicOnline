using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) 
            return;

    }

    private void Temizle()
    {
    //    foreach (var item in this.Controls)
    //    {
    //        if (item is TextBox)
    //        {
    //            TextBox txt = item as TextBox;
    //            txt.Text = "";
    //        }
    //        if (item is CheckBox)
    //        {
    //            if(cbAdmin.Checked)
    //            {
    //                cbAdmin.Checked = false;
    //            }
    //            else
    //                cbUser.Checked = false;
    //        }
    //    }
        txtAd.Text = "";
        txtMail.Text = "";
        txtPswd.Text = "";
        txtPswdAgain.Text = "";
        txtSoyad.Text = "";
        txtUsr.Text = string.Empty;
        if (cbAdmin.Checked)
        {
            cbAdmin.Checked = false;
        }
        else
            cbUser.Checked = false;
    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {

    }
    protected void btnIleri_Click(object sender, EventArgs e)
    {
        string ad, soyad, kullaniciAdi, sifre, eMail;

        ad = txtAd.Text;
        soyad = txtSoyad.Text;
        kullaniciAdi = txtUsr.Text;
        sifre = txtPswd.Text;
        eMail = txtMail.Text;
        if (cbAdmin.Checked == true)
        {
            GgDbProvider.AddUser(ad, soyad, kullaniciAdi, sifre, eMail, 0);
        }

        else if (cbUser.Checked == true)
        {
            GgDbProvider.AddUser(ad, soyad, kullaniciAdi, sifre, eMail, 1);
        }
        Temizle();

    }
}