using GgDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditProduct : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;

        ddlCategory.DataSource = GgDbProvider.GetCategoryList();
        ddlCategory.DataBind();

        if (Session["Oturum"] != null)
        {
            User currentUser = Session["Oturum"] as User;
            int id = Convert.ToInt32(Request.QueryString["id"]);
            Product p = new Product();
            p = GgDbProvider.Product.FirstOrDefault(i => i.ObjectID == id);
            if(p != default(Product))
            {
                txtProductName.Text = p.ProductName;
                txtPrice.Text = p.Price.ToString();
                txtQuantity.Text = p.Quantity.ToString();
                ddlCategory.SelectedIndex = p.CategoryID;
            }


        }
        else
        {
            Session["URL"] = "gelensiparis";
            Response.Redirect("Login.aspx");
        }
    }


    protected void Unnamed_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        Product p = new Product();
        p = GgDbProvider.Product.FirstOrDefault(i => i.ObjectID == id);

        p.ProductName = txtProductName.Text.Trim();
        p.Quantity = Convert.ToInt32(txtQuantity.Text.Trim());
        p.Price = Convert.ToDecimal(txtQuantity.Text.Trim());
        p.CategoryID = Convert.ToInt32(ddlCategory.SelectedValue);
        GgDbProvider.SaveChanges();
        Response.Redirect("ShopLayout.aspx");
    }
}