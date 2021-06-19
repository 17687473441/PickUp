using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class queryPost : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*string pl="";
        string condition = "";
        string sql = "SELECT post.postid, users.pic, users.othername, post.sendtime, post.text, post.imgpath, post.pd, COUNT(givelike.postid) AS count FROM post LEFT OUTER JOIN users ON users.phone = post.userid LEFT OUTER JOIN givelike ON givelike.postid = post.postid GROUP BY post.postid, users.pic, users.othername, post.sendtime, post.text, post.imgpath, post.pd ";
        string order = " order by sendtime desc";
        if (Session["FL"] != null && Session["condition"] != null && !("".Equals(Session["condition"])))
        {
            pl = Session["FL"].ToString();
            condition = Session["condition"].ToString();

            if ("全部".Equals(pl))
            {
                sql += "having (users.othername like '%" + condition + "%' or post.text like '%" + condition + "%') ";
            }else if ("榜单".Equals(pl))
            {
                sql += "having (users.othername like '%" + condition + "%' or post.text like '%" + condition + "%') ";
                order = " order by COUNT(givelike.postid) desc";
            }
            else
            {
                sql += "having post.pd='" + pl + "' and (users.othername like '%" + condition + "%' or post.text like '%" + condition + "%') ";
            }           
        }
        else if(Session["FL"] != null || Session["condition"] != null)
        {
            
            if(Session["FL"] == null &&(!"全部".Equals(Session["FL"])))
            {
                condition = Session["condition"].ToString();
                sql += "having (users.othername like '%" + condition + "%' or post.text like '%" + condition + "%') ";
            }
            else
            {
                if ("全部".Equals(Session["FL"]))
                {
                    sql += "having (users.othername like '%" + condition + "%' or post.text like '%" + condition + "%') ";
                }
                else if ("榜单".Equals(Session["FL"]))
                {
                    //sql += "having (users.othername like '%" + condition + "%' or post.text like '%" + condition + "%') ";
                    order = " order by COUNT(givelike.postid) desc";
                }
                else
                {
                    pl = Session["FL"].ToString();
                    sql += "having post.pd ='" + pl + "'";

                }
            }
            
        }
        */
        string sql = "SELECT post.postid, users.pic, users.othername,givelike.userid, post.sendtime, post.text, post.imgpath, post.pd, COUNT(givelike.postid) AS count FROM post LEFT OUTER JOIN users ON users.phone = post.userid LEFT OUTER JOIN givelike ON givelike.postid = post.postid GROUP BY post.postid, users.pic, users.othername,givelike.userid, post.sendtime, post.text, post.imgpath, post.pd";
        string order = " order by sendtime desc";
        string userid = Session["username"].ToString();
        SqlDataSource1.SelectCommand = sql+ " having givelike.userid="+userid + order;
        
        
    }
}
