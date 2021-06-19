using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class loginANDregister_register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnregister_Click(object sender, EventArgs e)
    {
        //1.获取form表单中用户填写的用户名和密码，获取HTML文本框内容的方式：控件ID.Value
        string uphone = phone.Text.Trim();
        string upsw = psw.Value;
        string umb1 = mb1.Value.Trim();
        string umb2 = mb2.Value.Trim();
        //2.连接并查询数据库
        //2.1从web.config读取数据库连接字符串


        //2.2构造sql命名对象
        string sql = "insert into users(phone,psw,mb1,mb2) values(@phone,@psw,@mb1,@mb2);";//sql语句中放变量的位置，用“@变量名”来声明一个变量

        SqlCommand comm = new SqlCommand();
        comm.CommandText = sql;

        comm.Parameters.AddWithValue("@phone", uphone);
        comm.Parameters.AddWithValue("@psw", upsw);
        comm.Parameters.AddWithValue("@mb1", umb1);
        comm.Parameters.AddWithValue("@mb2", umb2);

        int n = SqlHleper.changeData(comm);

        if (n > 0)
        {
            Response.Write("<script>alert('已注册成功,点击确定返回登录')</script>");
            Response.Redirect("login.aspx");
        }
        else
        {
            Response.Write("<script>alert('注册失败！')</script>");
        }
    }


    protected void phone_TextChanged(object sender, EventArgs e)
    {
        if (phone.Text.Trim() == null)
        {
            return;
        }
        //实现商品ID,即条形码的唯一性验证
        string sql = "select count(*) from users where phone = @phone";
        SqlCommand comm = new SqlCommand();
        comm.CommandText = sql;
        comm.Parameters.AddWithValue("@phone", phone.Text.Trim());

        object obj = SqlHleper.queryOneValue(comm);
        int b = int.Parse(obj.ToString());
        if (b > 0)
        {
            //条形码已被使用，验证不通过
            LabelInfo.Text = "当前账号已经存在，请重新输入";
        }
        else
        {
            //验证通过
            LabelInfo.Text = "";
        }




    }
}