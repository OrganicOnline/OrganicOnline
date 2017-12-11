using GgDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShopLayout : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        if (Session["Oturum"] != null)
        {
            User currentUser = Session["Oturum"] as User;
            if (currentUser != default(User))
            {
                rptSupplier.DataSource = GgDbProvider.GetProductList().Where(i => i.SupplierID == currentUser.ObjectID);
                rptSupplier.DataBind();
            }
        }
        else
        {
            Session["URL"] = "gelensiparis";
            Response.Redirect("Login.aspx");
        }




    }


    protected void rptSupplier_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "sil")
        {
            Product p = new Product();
            int id = Convert.ToInt32(e.CommandArgument);
            p = GgDbProvider.Product.FirstOrDefault(i => i.Deleted == false && i.ObjectID == id);
            p.Deleted = true;
            GgDbProvider.SaveChanges();
        }
        Response.Redirect("ShopLayout.aspx");
    }
}