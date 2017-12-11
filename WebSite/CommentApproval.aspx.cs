using GgDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CommentApproval : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;

        if (Session["Oturum"] != null)
        {
            User result = Session["Oturum"] as User;

            if (result != default(User) && result.RoleID == 1)
            {
                rptComments.DataSource = GgDbProvider.Comment.Where(a => a.Deleted != true && a.IsApproved == false).OrderBy(i => i.CommentDate);
                rptComments.DataBind();
            }
            else
            {
                Response.Redirect("Yetkisiz.aspx");
            }
        }
        else
            Response.Redirect("Login.aspx");


    }

    protected void rptComments_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Onayla")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            Comment c = GgDbProvider.Comment.FirstOrDefault(i => i.Deleted != true && i.ObjectId == id);
            if (c != default(Comment))
            {
                c.ApprovedDate = DateTime.Now;
                if (Session["Oturum"] != null)
                {
                    User result = Session["Oturum"] as User;

                    if (result != default(User) && result.RoleID == 1)
                    {
                        c.ApproverID =result.ObjectID;

                    }
                    else
                    {
                        Response.Redirect("Yetkisiz.aspx");
                    }
                }
                else
                    Response.Redirect("Login.aspx");
                c.IsApproved = true;
                GgDbProvider.SaveChanges();
                rptComments.DataSource = GgDbProvider.Comment.Where(a => a.Deleted != true && a.IsApproved == false).OrderBy(i => i.CommentDate);
                rptComments.DataBind();
            }
        }
        else if(e.CommandName == "Sil")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            Comment c = GgDbProvider.Comment.FirstOrDefault(i => i.Deleted != true && i.ObjectId == id);
            if (c != default(Comment))
            {
                c.Deleted = true;
                GgDbProvider.SaveChanges();
                rptComments.DataSource = GgDbProvider.Comment.Where(a => a.Deleted != true && a.IsApproved == false).OrderBy(i => i.CommentDate);
                rptComments.DataBind();
            }
        }
    }
}