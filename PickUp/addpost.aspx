<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addpost.aspx.cs" Inherits="addpost" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>发表点什么吧</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style=" width: 420px; padding: 10px 10px">
            <p>写点新鲜事</p>
            <asp:TextBox ID="text" runat="server" Height="100px" Width="400px" Columns="50"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="选择投放频道"></asp:Label>
            &nbsp;
            <asp:DropDownList ID="DropDownListpd" runat="server" Height="30px" Width="70px">
                <asp:ListItem Selected="True">无</asp:ListItem>
                <asp:ListItem>搞笑</asp:ListItem>
                <asp:ListItem>情感</asp:ListItem>
                <asp:ListItem>社会</asp:ListItem>
                <asp:ListItem>军事</asp:ListItem>
                <asp:ListItem>美女</asp:ListItem>
                <asp:ListItem>游戏</asp:ListItem>
                <asp:ListItem>科技</asp:ListItem>
                <asp:ListItem>时尚</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Image ID="Image2" runat="server" Height="110px" ImageUrl="~/img/postImg/nopic.gif" Width="100px" />
            <asp:FileUpload ID="FileUpload1" runat="server" Width="170px" /><asp:Button ID="ButtonUpload" runat="server" Text="上传" OnClick="ButtonUpload_Click" /><asp:Label ID="Labelerror" runat="server" Text=""></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;<br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           
             <asp:Button ID="btnpost" runat="server" Text="发布" OnClick="Button1_Click" />
            <br />
        </div>
    </form>
</body>
</html>
