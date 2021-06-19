using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class givelike : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["username"] == null)
            {

                Response.Redirect("login.aspx");
            }
            else
            {
                string userid = Session["username"].ToString();
                if (Request.QueryString["postid"] != null)
                {

                    string postid = Request.QueryString["postid"];
                    like(userid, postid);
                    
                }
                else
                {
                    Response.Redirect("public/index.aspx");
                }
            }
        }
        
    }
    public void like(string userid,string postid)
    {
        string liketime = DateTime.Now.ToString();
        string sql = "insert into givelike(userid,postid,liketime) values(@userid,@postid,@liketime);";//sql语句中放变量的位置，用“@变量名”来声明一个变量
        SqlCommand comm = new SqlCommand();
        comm.CommandText = sql;
        comm.Parameters.AddWithValue("@userid", userid);
        comm.Parameters.AddWithValue("@postid", postid);
        comm.Parameters.AddWithValue("@liketime", liketime);
        int n = SqlHleper.changeData(comm);
        if(n > 0)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('点赞成功！');location.href='public/index.aspx'</script>");
            //Response.Redirect("public/index.aspx");
        }
        else
        {
            sql = "delete from givelike where userid=@userid and postid = @postid";
            comm = new SqlCommand();
            comm.CommandText = sql;
            comm.Parameters.AddWithValue("@userid", userid);
            comm.Parameters.AddWithValue("@postid", postid);
            SqlHleper.changeData(comm);
            //Response.Redirect("public/index.aspx");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('取消点赞成功！');location.href='public/index.aspx'</script>");
        }
    }
}