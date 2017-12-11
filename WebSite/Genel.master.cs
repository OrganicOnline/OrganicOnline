using GgDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Genel : System.Web.UI.MasterPage
{
    public bool IsManav = false;
    public bool IsAdmin = false;
    public bool IsLogin = false;
    public string AdSoyad = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Oturum"] != null)
        {

            User control = Session["Oturum"] as User;
            if (control != default(User))
            {
                GgDBEntities provider = new GgDBEntities();
                Supplier result = provider.Supplier.FirstOrDefault(i => i.UserID == control.ObjectID);
                if (result != default(Supplier))
                    IsManav = true;
                if (control.RoleID == 1)
                    IsAdmin = true;

                IsLogin = true;

                AdSoyad = control.Ad + " " + control.Soyad;
            }
        }
    }

    protected void logOut_Click(object sender, EventArgs e)
    {
        Session["Oturum"] = null;
        Session["Urunler"] = null;
        Session["urunler"] = null;
        Session["ToplamUrunSayisi"] = null;
        Session["ToplamFiyat"] = null;
        Response.Redirect("Default.aspx");
    }

    protected void logIn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
}
