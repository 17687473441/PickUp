using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class personCtrl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Session["username"] != null) 
            {
                string name = Session["username"].ToString();
                if(name == "18778713904")
                {
                    Response.Redirect("admin/admin.html");
                }
                else
                {
                    Response.Redirect("user/user.html");
                }
            }
            else
            {
                FormsAuthentication.RedirectToLoginPage("login.aspx");
            }
        }
        

    }
}