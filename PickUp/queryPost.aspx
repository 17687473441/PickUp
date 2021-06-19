<%@ Page Language="C#" AutoEventWireup="true" CodeFile="queryPost.aspx.cs" Inherits="queryPost" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/onePost.css"/>
    <link rel="stylesheet" href="../css/font/iconfont.css" />
</head>
<body>
    <form id="form1" runat="server" >
       <%-- <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>
                <div class="post">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:connStr %>' SelectCommand="SELECT post.postid, users.pic, users.othername, post.sendtime, post.text, post.imgpath, post.pd, COUNT(givelike.postid) AS count FROM post LEFT OUTER JOIN users ON users.phone = post.userid LEFT OUTER JOIN givelike ON givelike.postid = post.postid GROUP BY post.postid, users.pic, users.othername, post.sendtime, post.text, post.imgpath, post.pd ORDER BY post.sendtime DESC"></asp:SqlDataSource>
                    <br />
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="1" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False">
                        <ItemTemplate>


                            <div class="row item_msg" style="width: 450px;">
                                <div class="col-sm-12 col-xs-12 message" style="border-bottom: 1px solid #e2e2e2">
                                    <asp:Image ID="Image1" runat="server" class="col-sm-2 col-xs-2" Style="border-radius: 50%; box-sizing: border-box;" ImageUrl='<%#Eval("pic")%>' />
                                    <div class="col-sm-10 col-xs-10">
                                        <span style="font-weight: bold; display: inline-block"><%#Eval("othername")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                                        <span style="color: #999">《<%#Eval("pd")%>》</span>
                                        <br>
                                        <small class="date" style="color: #999"><%#Eval("sendtime")%></small>
                                        <div class="msg_content">
                                            <%#Eval("text")%>
                                            <br />
                                            <asp:Image ID="Image2" runat="server" class="mypic" ImageUrl='<%#Eval("imgpath")%>' />
                                        </div>
                                    </div>
                                    <div class="icon-box">
                                        <a href='givelike.aspx?postid=<%#Eval("postid")%>' target="_top" ><span class="icon iconfont icon-dianzan">
                                            <%#Eval("count")%>
                                        
                                        </span></a>
                                        <a href='public/detailPost.aspx?postid=<%#Eval("postid")%>'><span class="icon iconfont icon-pinglun1"><span></span></span></a>


                                        <a href="#"><span class="icon iconfont icon-fenxiang"><span></span></span></a>
                                    </div>

                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>        
    </form>
</body>
</html>
