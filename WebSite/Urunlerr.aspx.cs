using GgDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Urunlerr : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        dlUrunler.DataSource = GgDbProvider.GetProductList();
        dlUrunler.DataBind();
        if (dlUrunler.Items.Count == 0)
        {
            pnlUrunler.Visible = false;
            pnlBilgi.Visible = true;
        }
        else
        {
            pnlUrunler.Visible = true;
            pnlBilgi.Visible = false;
        }

        lblTopFiyat.Text = "0 TL";
        lblUrunSayisi.Text = "0 Ürün";
        btnSiparis.CssClass += "btn btn-default butonn disabled";


        ddlFiltering.DataSource = GgDbProvider.GetCategoryList();
        ddlFiltering.DataBind();

        lstDistrict.DataSource = GgDbProvider.GetDistrictList();
        lstDistrict.DataBind();
        lstDistrict.Items.Add(new ListItem() { Text = "Seçiniz" });




        List<double> toplamFiyat = new List<double>();
        if (Session["ToplamFiyat"] != null)
        {
            toplamFiyat = Session["ToplamFiyat"] as List<double>;
            double toplam = ToplamUrunFiyatiniHesapla(toplamFiyat);
            lblTopFiyat.Text = toplam.ToString();

            lblSayi.Text = Session["ToplamUrunSayisi"].ToString();
            lblUrunSayisi.Text = Session["ToplamUrunSayisi"].ToString();
            lblUrunSayisi.Text += " " + "Ürün";

            lblTopFiyat.Text += " " + "TL";
            btnSiparis.CssClass += "btn btn-default butonn";
        }

        else
        {
            lblTopFiyat.Text = "";

            lblSayi.Text = "0";
            lblUrunSayisi.Text = "Sepetinizde ürün yok.";

        }
    }
    protected void dlUrunler_ItemCommand(object source, DataListCommandEventArgs args)
    {

        if (args.CommandName == "btnLeaveComment")
        {
            HiddenField hfCommentedProductId = (HiddenField)args.Item.FindControl("hfCommentedProductId");
            TextBox txtCommentBody = (TextBox)args.Item.FindControl("txtCommentBody");
            TextBox txtCommentHeader = (TextBox)args.Item.FindControl("txtCommentHeader");
            DropDownList ddlStar = (DropDownList)args.Item.FindControl("ddlStar");

            string comment = txtCommentBody.Text;
            string header = txtCommentHeader.Text;
            int star = Convert.ToInt32(ddlStar.SelectedValue);


            if (Session["Oturum"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                User autUser = Session["Oturum"] as User;
                if (autUser == default(User))
                    Response.Redirect("Login.aspx");
                else
                {
                    GgDbProvider.AddComment(header, comment, autUser.ObjectID, Convert.ToInt32(hfCommentedProductId.Value), star);
                    //pnlInfo.Visible = true;
                    Response.Write("<script>alert('Yorumunuz başarıyla eklendi. ');</script>");
                }
            }


        }
    }

    protected void dlUrunler_ItemDataBound(object sender, DataListItemEventArgs args)
    {
        if (args.Item.ItemType == ListItemType.Item || args.Item.ItemType == ListItemType.AlternatingItem)
        {
            Repeater childRepeater = (Repeater)args.Item.FindControl("rptCommentList");
            HiddenField hfCommentedProductId = (HiddenField)args.Item.FindControl("hfCommentedProductId");
            childRepeater.DataSource = GgDbProvider.GetCommentListForProduct(Convert.ToInt32(hfCommentedProductId.Value)).ToList();
            childRepeater.DataBind();

        }
    }



    protected void btnSepeteEkle_Click(object sender, EventArgs e)
    {
        btnSiparis.CssClass += "btn btn-default butonn";
        List<string> urunler;

        if (Session["Urunler"] != null)
        {
            urunler = Session["Urunler"] as List<string>;
            if (urunler == null)
                urunler = new List<string>();
            string eklenenUrun = lblUrunID.Value.ToString();
            urunler.Add(eklenenUrun);
            Session["Urunler"] = urunler;

            if (FarkliBirManavMi(urunler, eklenenUrun) == false)
            {
                int toplamUrunSayisi = Convert.ToInt32((Session["ToplamUrunSayisi"]));
                ++toplamUrunSayisi;
                Session["ToplamUrunSayisi"] = toplamUrunSayisi;
            }
            else
            {
                int i = urunler.Count();
                urunler.RemoveAt(i - 1);
                Session["Urunler"] = urunler;
                // UYARI DA YAZ BURAYA
            }



        }
        else
        {
            urunler = new List<string>();
            urunler.Add(lblUrunID.Value.ToString());
            Session["Urunler"] = urunler;
            Session["ToplamUrunSayisi"] = 1;
        }


        double fiyat = Convert.ToDouble(hfToplamFiyat.Value.Replace(".", ","));
        List<double> toplamFiyat = new List<double>();

        //if (Session["ToplamFiyat"] != null)
        //{
        //    double toplamFiyat = Convert.ToDouble(Session["ToplamFiyat"]);
        //    toplamFiyat += fiyat;
        //    Session["ToplamFiyat"] = toplamFiyat;

        //}
        if (Session["ToplamFiyat"] != null)
        {
            toplamFiyat = Session["ToplamFiyat"] as List<double>;
            toplamFiyat.Add(fiyat);
            Session["ToplamFiyat"] = toplamFiyat;

        }

        else
        {
            toplamFiyat.Add(fiyat);
            Session["ToplamFiyat"] = toplamFiyat;

        }
        double toplam = ToplamUrunFiyatiniHesapla(toplamFiyat);
        lblSayi.Text = Session["ToplamUrunSayisi"].ToString();
        lblUrunSayisi.Text = Session["ToplamUrunSayisi"].ToString();
        lblUrunSayisi.Text += " " + "Ürün";

        lblTopFiyat.Text = toplam.ToString();
        lblTopFiyat.Text += " " + "TL";

        txtMiktar.Text = "";

    }
    public double ToplamUrunFiyatiniHesapla(List<double> toplamFiyat)
    {
        double x = 0;
        foreach (double item in toplamFiyat)
        {
            x += item;
        }
        return x;
    }

    public bool FarkliBirManavMi(List<string> urunler, string eklenenUrun)
    {
        int lastItem = urunler.Count - 1;
        if (lastItem - 1 < 0)
            return false;
        int karsılastırılacakUrun = Convert.ToInt32(urunler[lastItem - 1]);
        int eklenenUrunId = Convert.ToInt32(eklenenUrun);
        GgDB.Product p_1 = new GgDB.Product();
        GgDB.Product p_2 = new GgDB.Product();

        p_1 = GgDbProvider.Product.First(i => i.ObjectID == karsılastırılacakUrun);
        p_2 = GgDbProvider.Product.First(i => i.ObjectID == eklenenUrunId);


        if (p_1.Supplier.ObjectID == p_2.Supplier.ObjectID)
        {
            return false;
        }
        else
        {
            return true;
        }
    }
    protected void btnSiparis_Click(object sender, EventArgs e)
    {
        Response.Redirect("UrunSiparis.aspx");
    }

    protected void ddlFiltering_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlFiltering.SelectedValue == "Seçiniz")
            dlUrunler.DataSource = GgDbProvider.GetProductList();
        else
            dlUrunler.DataSource = GgDbProvider.GetProductList().Where(i => i.CategoryID == Convert.ToInt32(ddlFiltering.SelectedValue));
        dlUrunler.DataBind();
        if (dlUrunler.Items.Count == 0)
        {
            pnlUrunler.Visible = false;
            pnlBilgi.Visible = true;
        }
        else
        {
            pnlUrunler.Visible = true;
            pnlBilgi.Visible = false;
        }
    }

    protected void ddlSorting_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlSorting.SelectedValue == "artan")
        {
            dlUrunler.DataSource = GgDbProvider.GetProductList().OrderBy(i => i.Price);
            dlUrunler.DataBind();
        }
        else if (ddlSorting.SelectedValue == "azalan")
        {
            dlUrunler.DataSource = GgDbProvider.GetProductList().OrderByDescending(i => i.Price);
            dlUrunler.DataBind();
        }
        if (dlUrunler.Items.Count == 0)
        {
            pnlUrunler.Visible = false;
            pnlBilgi.Visible = true;
        }
        else
        {
            pnlUrunler.Visible = true;
            pnlBilgi.Visible = false;
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        List<Product> result = new List<Product>();
        if (txtSearchProduct.Text.Trim() != "" && txtSearchSupplier.Text.Trim() != "")
            result = GgDbProvider.GetProductList().Where(i => i.ProductName.ToLower().Contains(txtSearchProduct.Text.Trim().ToLower()) || i.Supplier.CompanyName.ToLower().Contains(txtSearchSupplier.Text.Trim().ToLower())).ToList();
        else if (txtSearchProduct.Text.Trim() != "" && txtSearchSupplier.Text.Trim() == "")
            result = GgDbProvider.GetProductList().Where(i => i.ProductName.ToLower().Contains(txtSearchProduct.Text.Trim().ToLower())).ToList();
        else if (txtSearchProduct.Text.Trim() == "" && txtSearchSupplier.Text.Trim() != "")
            result = GgDbProvider.GetProductList().Where(i => i.Supplier.CompanyName.ToLower().Contains(txtSearchSupplier.Text.Trim().ToLower())).ToList();
        else
            result = GgDbProvider.GetProductList();

        List<Product> result2 = new List<Product>();
        foreach (int item in lstDistrict.GetSelectedIndices())
        {
            result2.AddRange(result.Where(i => i.Supplier.DistrictID == Convert.ToInt32(lstDistrict.Items[item].Value)).ToList());
        }

        dlUrunler.DataSource = result2;
        dlUrunler.DataBind();
        if (dlUrunler.Items.Count == 0)
        {
            pnlUrunler.Visible = false;
            pnlBilgi.Visible = true;
        }
        else
        {
            pnlUrunler.Visible = true;
            pnlBilgi.Visible = false;
        }
    }


}