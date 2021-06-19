using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
public partial class addpost : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["username"] == null)
        //{

        //    FormsAuthentication.RedirectToLoginPage(Server.HtmlEncode("../addpost.aspx"));
        //}

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string utext = text.Text.Trim();
        string utime = DateTime.Now.ToString();
        string upd = DropDownListpd.SelectedValue;
        string uname = Session["username"].ToString();
        string uimgpath = Image2.ImageUrl;
        if (uimgpath == "~/img/postImg/nopic.gif")
        {
            uimgpath = "";
        }
        
        
        try
        {
            //2.2构造sql命名对象
            string sql = "insert into post(text,sendtime,pd,userid,imgpath) values(@text,@sendtime,@pd,@userid,@imgpath);";//sql语句中放变量的位置，用“@变量名”来声明一个变量
            SqlCommand comm = new SqlCommand();
            comm.CommandText = sql;
            comm.Parameters.AddWithValue("@text", utext);
            comm.Parameters.AddWithValue("@sendtime", utime);
            comm.Parameters.AddWithValue("@pd", upd);
            comm.Parameters.AddWithValue("@userid", uname);
            comm.Parameters.AddWithValue("@imgpath", uimgpath);
            int n = SqlHleper.changeData(comm);
            if (n > 0)
            {
                /*window.location.href='public/index.html'*/
                Response.Write("<script>alert('发帖成功')</script>");
                text.Text = "";
                DropDownListpd.SelectedIndex = 0;
                Image2.ImageUrl = "~/img/postImg/nopic.gif";
            }
            else
            {
                Response.Write("<script>alert('发帖失败！')</script>");
            }
        }
        catch(Exception exq)
        {
            Response.Write("<script>alert('系统维护中...')</script>");

        }
       
    }

    protected void ButtonUpload_Click(object sender, EventArgs e)
    {
        //上传封面图片
        //1.判断用户是否已经选择了文件
        if (FileUpload1.HasFile)
        {
            //2.判断用户选择的文件是否是图片类型
            string ext = System.IO.Path.GetExtension(FileUpload1.FileName);//获取文件拓展名
            ext = ext.ToLower();//将拓展名转换成小写
            if (ext == ".jpg" || ext == ".jpeg" || ext == ".gif" || ext == ".png")
            {
                string vpath;
                //用户第一次上传第一个图片，需要重命名一个新的名字
                //3.为了防止同名文件覆盖，要给文件重命名为一个唯一的名字
                string name = System.DateTime.Now.Ticks.ToString() + ext;//文件重命名为当前日期时间的计时周期数                                                                           //4.制定文件保存的相对路径
                vpath = "~/img/postImg/" + name;//文件保存的相对路径=虚拟路径
                //5.将相对路径转换为绝对路径=物理路径
                string rpath = Server.MapPath(vpath);
                FileUpload1.SaveAs(rpath);//上传文件，用物理路径
                                          //6.用图片控件显示上传成功的图片文件
                Image2.ImageUrl = vpath;
                Labelerror.Text = "";
            }
            else
            {
                Labelerror.Text = "选择的图片文件必须为.jpg、.jpeg、.gif类型";
            }
        }
        else
        {
            Labelerror.Text = "没有选择图片文件";
        }
    }
}