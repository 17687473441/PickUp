using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 修改用户信息 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lablephone.Text = Session["username"].ToString();  
    }


    protected void ButtonXG_Click(object sender, EventArgs e)
    {
        string name = lablephone.Text;
        string QRpsw = TBQRpsw.Text.Trim();
        string sql = "update users set psw='"+QRpsw+"' where phone='"+name+"'";
        if (name == "18778713904")
        {
            sql="update admin set psw='"+QRpsw+"' where phone = '"+ name+"'";
        }
        //string sql1_1 = "select psw from admin where phone="+ name+"'";
        int i = SqlHleper.changeData(sql);
        if (i>0)
        {
            Response.Write("<script>alert('修改密码成功,下次用新设置的密码登录')</script>");

        }
        else
        {
            Response.Write("<script>alert('修改密码失败')</script>");
        }
    }

    protected void TBJpsw_TextChanged(object sender, EventArgs e)
    {
        string Jpsw = TBJpsw.Text.Trim();
        string name = lablephone.Text;
        //实现商品ID,即条形码的唯一性验证
        string sql = "select psw from users where phone='" + name + "'";      
        if (name == "18778713904")
        {
            sql= "select psw from admin where phone='" + name + "'";
        }
        object obj = SqlHleper.queryOneValue(sql);
        string b = obj.ToString();
        if (!Jpsw.Equals(b))
        {
            //密码跟数据库里查询的不一致
            Labelerror.Text = "密码错误";
        }
        else
        {
            //验证通过
            Labelerror.Text = "";
        }
    }
}