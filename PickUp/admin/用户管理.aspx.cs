using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_用户管理 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lkbt_delete_Click(object sender, EventArgs e)
        
    {
        LinkButton lb = (LinkButton)sender;
        string delSQL = "delete from users where phone='" + lb.CommandArgument+"'";
        int flag = SqlHleper.changeData(delSQL);
        if (flag > 0)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('删除用户成功！');</script>");
            GridView1.DataBind();           
        }
        else
        {

            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('删除用户失败！');</script>");
        }


    }
}