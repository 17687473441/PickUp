using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
public partial class queryPost : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session["username"] != null)
        {
            if (!IsPostBack)
            {
                DataList1.DataBind();
            }
           
        }
        else 
        {
            FormsAuthentication.RedirectToLoginPage("user/queryUserPost.aspx");
        }

    }

    protected void LinkButtonedit_Click(object sender, EventArgs e)
    {

        LinkButton lb = (LinkButton)sender;
        string delSQL = "delete from post where postid='" + lb.CommandArgument + "'";
        int flag = SqlHleper.changeData(delSQL);
        if(flag > 0)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('删除帖子成功！');</script>");
            DataList1.DataBind();
        }
        else
        {

            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('删除失败！');</script>");
        }
    }
}