using GgDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        rptSupplier.DataSource = GgDbProvider.GetSupplierList();
        rptSupplier.DataBind();

        lstDistrict.DataSource = GgDbProvider.GetDistrictList();
        lstDistrict.DataBind();
        lstDistrict.Items.Add(new ListItem() { Text = "Seçiniz" });

    }

    protected void rptSupplier_ItemDataBound(object sender, RepeaterItemEventArgs args)
    {
        if (args.Item.ItemType == ListItemType.Item || args.Item.ItemType == ListItemType.AlternatingItem)
        {
            Repeater childRepeater = (Repeater)args.Item.FindControl("rptCommentList");
            HiddenField hfCommentedProductId = (HiddenField)args.Item.FindControl("hfCommentedProductId");
            Panel pnlInfo = (Panel)args.Item.FindControl("pnlInfo");

            childRepeater.DataSource = GgDbProvider.GetCommentListForProduct(Convert.ToInt32(hfCommentedProductId.Value)).ToList();
            childRepeater.DataBind();
            if (childRepeater.Items.Count < 1)
                pnlInfo.Visible = true;
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
       List<Supplier> result = GgDbProvider.GetSupplierList();

        List<Supplier> result2 = new List<Supplier>();
        foreach (int item in lstDistrict.GetSelectedIndices())
        {
            result2.AddRange(result.Where(i => i.DistrictID == Convert.ToInt32(lstDistrict.Items[item].Value)).ToList());
        }

        rptSupplier.DataSource = result2;
        rptSupplier.DataBind();
        if (rptSupplier.Items.Count == 0)
        {
            //pnlUrunler.Visible = false;
            pnlBilgi.Visible = true;
        }
        else
        {
            //pnlUrunler.Visible = true;
            pnlBilgi.Visible = false;
        }
    }
}