using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class public_index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string pisfasd = pic.ImageUrl.ToString();
        if (Session["username"] != null)
        {
            
            string  id = Session["username"].ToString();
            
            if (id=="18778713904")
            {
                pic.ImageUrl = "~/img/管理员猫猫.jpg";
            }
            else
            {
                pic.ImageUrl = changepic(id);

            }

        }
        else
        {
            pic.ImageUrl = "~/img/pic/default_face.jpg";

        }
        if (!IsPostBack)
        {
            Session["pic"] = pic.ImageUrl;

        }

    }
    public string changepic(string id) 
    {
        string phone = id;
        string sql="select pic from users where phone='"+id+"'";
        object obj = SqlHleper.queryOneValue(sql);
        
        string pic = obj.ToString();
        Session["pic"] = pic;
        return pic;
    
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        
        changesFL(sender);
    }

    private void changesFL(object sender)
    {
        LinkButton lb = (LinkButton)sender;
        Session["FL"] = lb.Text;
        Session["condition"] = TextBoxSearch.Text.Trim();
        //Session["pic"] = pic.ImageUrl;
        Response.Redirect("index.aspx");
    }

    protected void LBQG_Click(object sender, EventArgs e)
    {
        changesFL(sender);

    }

    protected void pic_Click(object sender, ImageClickEventArgs e)
    {
        FormsAuthentication.SignOut();
        Session.Clear();
        Response.Redirect("index.aspx",true);
    }
    //多条件搜索
    protected void search(object sender, ImageClickEventArgs e)
    {
        string seaStr = TextBoxSearch.Text.Trim();
        Session["condition"] = seaStr;
        Response.Redirect("index.aspx");


    }
}