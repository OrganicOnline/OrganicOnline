using GgDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GelenSiparis : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        if (Session["Oturum"] != null)
        {
            User currentUser = Session["Oturum"] as User;
            if (currentUser != default(User))
            {
                rptSiparislerim.DataSource = GgDbProvider.GetOrderBySupplierId(currentUser.ObjectID);
                rptSiparislerim.DataBind();
            }
            if (rptSiparislerim.Items.Count == 0)
            {
                lblNoSiparis.Visible = true;
            }
        }
        else
        {
            Session["URL"] = "gelensiparis";
            Response.Redirect("Login.aspx");
        }
    }


    protected void rptSiparislerim_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "iptal")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            Order o = GgDbProvider.GetOrderByObjectId(id);
            if (o != default(Order))
            {
                o.StatusId = 4;
            }
            o.LastOperationDate = DateTime.Now;
        }
        if (e.CommandName == "onay")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            Order o = GgDbProvider.GetOrderByObjectId(id);
            if (o != default(Order))
            {
                o.StatusId = 2;
            }
            o.LastOperationDate = DateTime.Now;
        }
       
        GgDbProvider.SaveChanges();
        if (Session["Oturum"] != null)
        {
            User currentUser = Session["Oturum"] as User;
            if (currentUser != default(User))
            {
                rptSiparislerim.DataSource = GgDbProvider.GetOrderBySupplierId(currentUser.ObjectID);
                rptSiparislerim.DataBind();
            }
        }
        else
        {
            Session["URL"] = "gelensiparis";
            Response.Redirect("Login.aspx");
        }
    }

    protected void rptSiparislerim_ItemDataBound(object sender, RepeaterItemEventArgs args)
    {
        if (args.Item.ItemType == ListItemType.Item || args.Item.ItemType == ListItemType.AlternatingItem)
        {
            Panel pnlButtons = (Panel)args.Item.FindControl("pnlButtons");
            Label lblBilgi = (Label)args.Item.FindControl("lblBilgi");
            Label spanBilgi = (Label)args.Item.FindControl("spanBilgi");

            Repeater rptSiparislerim = (Repeater)args.Item.FindControl("rptSiparislerim");
            Order o = args.Item.DataItem as Order;
            if (o.StatusId == 1)
            {
                spanBilgi.CssClass = "label label-warning pull-right";
                pnlButtons.Visible = true;
                lblBilgi.Visible = false;
            }
            else if (o.StatusId == 2)
            {
                spanBilgi.CssClass = "label label-info pull-right";
                pnlButtons.Visible = false;
                lblBilgi.Text = "Sipariş kargoya verilmiştir. Müşteri tarafından teslim alınıp onaylandıktan sonra tarafınıza bilgilendirme yapılacaktır.";
                lblBilgi.Visible = true;
            }
            else if (o.StatusId == 3)
            {
                spanBilgi.CssClass = "label label-primary pull-right";
                pnlButtons.Visible = false;
                lblBilgi.Text = "Sipariş müşteri tarafından teslim alınmıştır.";
                lblBilgi.Visible = true;
            }
            else if (o.StatusId == 4)
            {
                spanBilgi.CssClass = "label label-danger pull-right";
                pnlButtons.Visible = false;
                lblBilgi.Text = "Sipariş tarafınızca iptal edilmiştir.";
                lblBilgi.Visible = true;
            }
            else if (o.StatusId == 6)
            {
                spanBilgi.CssClass = "label label-danger pull-right";
                pnlButtons.Visible = false;
                lblBilgi.Text = "Sipariş müşteri tarafından iptal edilmiştir. (Ürün 15 gün aşımına uğramıştır.)";
                lblBilgi.Visible = true;
            }
        }
    }
}