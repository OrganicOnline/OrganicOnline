using GgDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : BasePage
{
    //static int sayi = 0;
    protected void Page_Load(object sender, EventArgs e)
    {


    }


    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string usr = txtKullaniciAdi.Text;
        string pswd = txtPswd.Text;
        User result = GgDbProvider.GetUserByUsernameAndPassword(usr, pswd);
        if (result != default(User))
        {
            Session["Oturum"] = result;
            if (Session["URL"] as string == "siparis")
                Response.Redirect("UrunSiparis.aspx");
            else if (Session["URL"] as string == "siparislerim")
                Response.Redirect("Siparislerim.aspx");
            else if(Session["URL"] as string == "gelensiparis")
                Response.Redirect("GelenSiparis.aspx");
            else
                Response.Redirect("Urunlerr.aspx");

        }
        else
        {
            panelDanger.Visible = true;
            Session["Oturum"] = null;

        }
    }
}