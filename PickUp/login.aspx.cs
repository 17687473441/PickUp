using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class loginANDregister_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if(Session["username"]!=null)
        {
            string k = Session["username"].ToString();
            //FormsAuthentication.SignOut();
            //Response.Write("<script>alert('当前已登录')</script>");
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //1.获取form表单中用户填写的用户名和密码，获取HTML文本框内容的方式：控件ID.Value
        string uname = username.Value.Trim();
        string upsw = psw.Value;
        //2.连接并查询数据库
        //2.1从web.config读取数据库连接字符串


        
        //2.2构造sql命名对象

        string sql = "select * from users where phone=@username and psw=@psw";//sql语句中放变量的位置，用“@变量名”来声明一个变量
        SqlCommand comm = new SqlCommand();
        comm.CommandText = sql;
        comm.Parameters.AddWithValue("@username", uname);
        comm.Parameters.AddWithValue("@psw", upsw);
        object obj = SqlHleper.queryOneValue(comm);
        if (obj != null)
        {
            //如果用户登录成功，用session记录用户名和角色，以后后期进行操作权限控制时使用
            Session["username"] = uname;
            Session["role"] = obj.ToString();
            FormsAuthentication.RedirectFromLoginPage(uname, false);//登入：给当前用户一张票据，给他授权
            Labeleroor.Text = "一般用户登录成功";
            
            //Response.Write("<script>alert('一般用户登录成功');window.location.href='../user/user.html'</script>");           
            //Response.Redirect("public/index.html");
        }
        else
        {
            sql = "select * from admin where phone=@username and psw=@psw";//sql语句中放变量的位置，用“@变量名”来声明一个变量
            comm = new SqlCommand();
            comm.CommandText = sql;
            comm.Parameters.AddWithValue("@username", uname);
            comm.Parameters.AddWithValue("@psw", upsw);
            object obj1 = SqlHleper.queryOneValue(comm);
            if (obj1 != null)
            {
                //如果用户登录成功，用session记录用户名和角色，以后后期进行操作权限控制时使用
                Session["username"] = uname;
                Session["role"] = obj1.ToString();
                FormsAuthentication.RedirectFromLoginPage(uname, false);//登入：给当前用户一张票据，给他授权
                Labeleroor.Text = "管理员登录成功";
                //Response.Write("<script>alert('管理员登录成功');window.location.href='../admin/admin.html'</script>");
                Response.Redirect("public/index.aspx");
            }
            else
            {
                //如果登录失败。提示用户名或密码错误，让用户重新输入
                Labeleroor.Text = "用户名或密码错误，请重新输入";
            }
        }


        //3.根据数据库返回的查询结果，判断用户有没有登录成功
    }
}