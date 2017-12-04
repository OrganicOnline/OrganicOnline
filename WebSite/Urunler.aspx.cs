using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Urunler : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (IsPostBack) return;
        //dlUrunler.DataSource = GgDbProvider.GetSupplierList();
        //dlUrunler.DataBind();
    }

    protected void dlUrunler_ItemCommand(object source, DataListCommandEventArgs e)
    {

    }
}