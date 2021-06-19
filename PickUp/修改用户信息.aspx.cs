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
        //pic.ImageUrl = Session["pic"].ToString();

            lablephone.Text = Session["username"].ToString();
            if (!IsPostBack)
            {
                loadpic();

            }
    }
    public void loadpic()
    {
        //2.2构造sql命名对象
        string sql = "select pic from users where phone=" + Session["username"].ToString();
        object obj = SqlHleper.queryOneValue(sql);      
        //reader.GetOrdinal("id")是得到ID所在列的index,  
        //reader.GetInt32(int n)这是将第n列的数据以Int32的格式返回  
        //reader.GetString(int n)这是将第n列的数据以string 格式返回  
            
        //lablephone.Text = phone;
        pic.ImageUrl = obj.ToString();
    }
    protected void ButtonQC_Click(object sender, EventArgs e)
    {
        clear();
    }

    private void clear()
    {        
        TextBoxName.Text = "";
        TextBoxDay.Text = "";
        TextBoxQM.Text = "";
    }

    protected void ButtonXG_Click(object sender, EventArgs e)
    {
        string uid = lablephone.Text;
        string upic = pic.ImageUrl;
        string uday = TextBoxDay.Text.Trim();
        string uxb = RadioButtonListXB.SelectedValue;
        string uqm = TextBoxQM.Text;
        string uname = TextBoxName.Text.Trim();
        if(uname == "")
        {
            uname = "PickUp用户";
        }
        //2.2构造sql命名对象
        string sql = "update users set othername = @othername, signword = @signword, birthday = @birthday, sex = @sex, pic = @pic where phone = @phone";//sql语句中放变量的位置，用“@变量名”来声明一个变量
        SqlCommand comm = new SqlCommand();
        comm.CommandText = sql;
        comm.Parameters.AddWithValue("@phone", uid);
        comm.Parameters.AddWithValue("@othername", uname);
        comm.Parameters.AddWithValue("@signword", uqm);
        comm.Parameters.AddWithValue("@birthday", uday);
        comm.Parameters.AddWithValue("@sex", uxb);
        comm.Parameters.AddWithValue("@pic", upic);
        int n = SqlHleper.changeData(comm);
        if (n > 0)
        {
            Response.Write("<script>alert('修改成功')</script>");
            //clear();
        }
        else
        {
            Response.Write("<script>alert('修改失败！')</script>");
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
                        string name = System.DateTime.Now.Ticks.ToString() + ext;//文件重命名为当前日期时间的计时周期数
                                                                                 //4.制定文件保存的相对路径
                        vpath = "~/img/pic/" + name;//文件保存的相对路径=虚拟路径
                  
                    //5.将相对路径转换为绝对路径=物理路径
                    string rpath = Server.MapPath(vpath);
                    FileUpload1.SaveAs(rpath);//上传文件，用物理路径
                                              //6.用图片控件显示上传成功的图片文件
                    pic.ImageUrl = vpath;
                    //Labelerror.Text = "";
                }
                else
                {
                    //Labelerror.Text = "选择的图片文件必须为.jpg、.jpeg、.gif类型";
                }
            }
            else
            {
                //Labelerror.Text = "没有选择图片文件";
            }
        
    }
}