<%@ Page Language="C#" AutoEventWireup="true" CodeFile="帖子管理.aspx.cs" Inherits="queryPost" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="../css/onePost.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connStr %>" SelectCommand="select postid,userid,pic,othername,sendtime,text,imgpath, pd from post,users where users.phone = post.userid order by sendtime desc"></asp:SqlDataSource>
            <br />
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="1">
                <ItemTemplate>
                    
                    <div class="row item_msg" style="width:450px">
                        <div class="col-sm-12 col-xs-12 message">                       
                            <asp:Image ID="Image1" runat="server" class="col-sm-2 col-xs-2" style="border-radius: 50%;box-sizing: border-box;" ImageUrl='<%#Eval("pic")%>'/>
                            <div class="col-sm-10 col-xs-10">
                                <span style="font-weight: bold;"><%#Eval("othername")%></span>
                                <br>
                                <small class="date" style="color:#999"><%#Eval("sendtime")%></small>
                                <div class="msg_content">                                   
                                    <%#Eval("text")%>
                                    <br />
                                <asp:Image ID="Image2" runat="server" class="mypic" ImageUrl='<%#Eval("imgpath")%>' />
                                </div>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("postid") %>' OnClick="LinkButton1_Click">删除</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    
                </ItemTemplate>
            </asp:DataList>
        </div>
    </form>
</body>
</html>
