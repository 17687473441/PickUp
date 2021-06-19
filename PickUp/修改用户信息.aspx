<%@ Page Language="C#" AutoEventWireup="true" CodeFile="修改用户信息.aspx.cs" Inherits="修改用户信息" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div style="margin-left:0px;margin-top:0px;width:600px">
            <table style="padding:20px 20px";>
                <tr>
                    <td style="text-align:right";>
                        账号：
                    </td>
                    <td>
                        <asp:Label ID="lablephone" runat="server" Text=""></asp:Label>
                        
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right";>
                        头像：
                    </td>
                    <td>
                        <asp:Image ID="pic" runat="server" Style="border-radius: 50%; box-sizing: border-box; width: 50px" ImageUrl="~/img/pic/default_face.jpg" />
                        <br />
                        <br />
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <asp:Button ID="ButtonUpload" runat="server" OnClick="ButtonUpload_Click" Text="上传" />
                    </td>
                </tr>
                <tr>
                    <td  style="text-align:right";>
                        昵称：
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxName" runat="server" Height="30px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td  style="text-align:right";>
                        生日：
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxDay" runat="server" Height="30px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right";>
                        性别：
                    </td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonListXB" runat="server" RepeatDirection="Horizontal" Height="30px">
                            <asp:ListItem Selected="True">男</asp:ListItem>
                            <asp:ListItem>女</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right";>
                        个性签名：
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxQM" runat="server" Height="80px" Width="400px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        
                    </td>
                    <td style="text-align:center">
                        <asp:Button ID="ButtonQC" runat="server" Text="清除" OnClick="ButtonQC_Click" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="ButtonXG" runat="server" Text="修改" OnClick="ButtonXG_Click" />

                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
