using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class queryPost : System.Web.UI.Page
{

    string userid = "";
    string postid = "";
    string comtext = "";
    string comtime = "";
    string beforeid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            pic.ImageUrl = Session["pic"].ToString();
            if (Request.QueryString["postid"] != null)
            {

                postid = Request.QueryString["postid"];
                SqlCommand comm = new SqlCommand();
                comm.CommandText = "pro_POSTDetail";
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.AddWithValue("@postid", postid);
                DataSet ds = SqlHleper.queryDataSet(comm);
                FormView1.DataSource = ds.Tables[0];
                FormView1.DataBind();
                GridViewComment.DataSource = ds.Tables[1];
                GridViewComment.DataBind();
                               
                //string sql = "select postid,userid,pic,othername,sendtime,text,imgpath, pd from post,users where users.phone = post.userid and postid="+ postid;
                //SqlDataSource1.SelectCommand = sql;
            }
            else
            {
                Response.Redirect("index.aspx");
            } 
        }
       
    }


    //发表评论
    protected void Button1_Click(object sender, EventArgs e)
    {
        if(Session["username"] == null)
        {
            //Response.Write("<Script Language=JavaScript>alert('登录才可以对帖子进行评论回复，请登录！')</Script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('登录才可以对帖子进行评论回复，请登录！');</script>");
            //FormsAuthentication.RedirectToLoginPage();

        }
        else
        {
            userid = Session["username"].ToString();
            comtext = Request.Form["commentText"].ToString();
            if ("".Equals(comtext))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('评论内容不能为空！');</script>");
                return;
            }
            comtime = DateTime.Now.ToString();
            postid = Request.Form["postId"].ToString();
            string sql = "insert into comment(userid,postid,comtext,comtime) values(@userid,@postid,@comtext,@comtime)";
            SqlCommand comm = new SqlCommand();
            comm.CommandText = sql;
            comm.Parameters.AddWithValue("@userid", userid);
            comm.Parameters.AddWithValue("@postid", postid);
            comm.Parameters.AddWithValue("@comtext", comtext);
            comm.Parameters.AddWithValue("@comtime", comtime);            
            int n = SqlHleper.changeData(comm);
            if(n > 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('评论成功！');</script>");
                //Response.Write("<script>alert('评论成功')</script>");
                SqlCommand comm2 = new SqlCommand();
                comm2.CommandText = "select comment.*,users.pic,users.othername from comment,users where users.phone = comment.userid and (beforeid is null and postid = @postid) order by comtime desc";               
                comm2.Parameters.AddWithValue("@postid", postid);
                DataSet ds1 = SqlHleper.queryDataSet(comm2);
                GridViewComment.DataSource = ds1;
                GridViewComment.DataBind();
            }
        }
    }


    //回复
    protected void ButtonReply_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;
        if (Session["username"] == null)
        {
            //Response.Write("<Script Language=JavaScript>alert('登录才可以对帖子进行评论回复，请登录！')</Script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('登录才可以对评论进行回复，请登录！');</script>");
            //FormsAuthentication.RedirectToLoginPage();
        }
        else
        {
            //string firstComName = Request.Form["firstComName"].ToString();
            userid = Session["username"].ToString();
            comtext = Request.Form["replytext"].ToString();                       
            if ("".Equals(comtext))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('回复内容不能为空！');</script>");
                return;
            }
            comtime = DateTime.Now.ToString();
            postid = Request.Form["postId"].ToString();
            beforeid = btn.CommandArgument.ToString();
            string sql = "insert into comment(userid,postid,comtext,comtime,beforeid) values(@userid,@postid,@comtext,@comtime,@beforeid)";
            SqlCommand comm = new SqlCommand();
            comm.CommandText = sql;
            comm.Parameters.AddWithValue("@userid", userid);
            comm.Parameters.AddWithValue("@postid", postid);
            comm.Parameters.AddWithValue("@comtext", comtext);
            comm.Parameters.AddWithValue("@comtime", comtime);
            comm.Parameters.AddWithValue("@beforeid", beforeid);
            int n = SqlHleper.changeData(comm);
            if (n > 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('回复评论成功！');</script>");
                //Response.Write("<script>alert('评论成功')</script>");
                SqlCommand comm3 = new SqlCommand();
                comm3.CommandText = "select comment.*,users.pic,users.othername from comment,users where users.phone = comment.userid and (beforeid is null and postid = @postid) order by comtime desc;;";
                comm3.Parameters.AddWithValue("@postid", postid);
                DataSet ds2 = SqlHleper.queryDataSet(comm3);
                GridViewComment.DataSource = ds2;
                GridViewComment.DataBind();
            }

        }        
    }

    protected void GridViewComment_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if(e.Row.RowType == DataControlRowType.DataRow)
        {
            SqlDataSource ss = e.Row.FindControl("SqlDataSource1") as SqlDataSource;
            ss.SelectCommand = string.Format("select comment.*,users.pic,users.othername from comment,users where users.phone = comment.userid and postid ={0}  and beforeid={1} order by comtime desc", postid, GridViewComment.DataKeys[e.Row.RowIndex].Value);
            GridView gv = e.Row.FindControl("GridViewReply") as GridView;
            gv.DataBind();
        }
    }
}