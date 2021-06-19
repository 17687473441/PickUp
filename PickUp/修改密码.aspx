<%@ Page Language="C#" AutoEventWireup="true" CodeFile="修改密码.aspx.cs" Inherits="修改用户信息" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .TextBox {
            background-color:none;
            height:30px;
        }
        .tab {
            padding:10px 10px; 
            width: 400px; 
            height: 450px;
        }
        td{
            border-bottom:1px solid #efeded;
        }
        .auto-style1 {
            width: 137px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
        <div style="margin-left:0px;margin-top:0px;width:600px">
            <table class="tab">
                <tr>
                    <td style="text-align:center" colspan="2" class="auto-style2">
                        设置PickUp密码
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;" class="auto-style1" >
                        账号：
                    </td>
                    <td>
                        <asp:Label ID="lablephone" runat="server" Text=""></asp:Label>
                        
                    </td>
                </tr>
                <tr>
                    <td  style="text-align:right"; class="auto-style1">
                        旧密码：
                    </td>
                    <td>
                        <asp:TextBox ID="TBJpsw" class="TextBox" runat="server" OnTextChanged="TBJpsw_TextChanged" autocomplete="off" AutoPostBack="True" TextMode="Password"></asp:TextBox>

                        <br />

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TBJpsw" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Red">该项不能为空</asp:RequiredFieldValidator>

                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
				        <ContentTemplate>
					    <asp:Label ID="Labelerror" runat="server" ForeColor="Red" Display="Dynamic"></asp:Label>
				        </ContentTemplate>
				        <Triggers>
                            <asp:AsyncPostBackTrigger EventName="TextChanged" ControlID="TBJpsw" />
                        </Triggers>
                        </asp:UpdatePanel>

                    </td>
                </tr>
                <tr>
                    <td  style="text-align:right"; class="auto-style1">
                        新密码：
                    </td>
                    <td>
                        <asp:TextBox ID="TBXpsw" class="TextBox" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right"; class="auto-style1">
                        确认密码：
                    </td>
                    <td>
                        <asp:TextBox ID="TBQRpsw" class="TextBox" runat="server" TextMode="Password"></asp:TextBox>
                        <%--<asp:Label ID="LabeleQRpsw" runat="server" ForeColor="Red"></asp:Label>--%>
                        <br />
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="两次输入的密码需要一致" ControlToCompare="TBXpsw" ControlToValidate="TBQRpsw" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right" class="auto-style1">                                                
                        <a href="找回密码.aspx">忘记密码</a>
                        
                    </td>
                    <td style="text-align:center">
                        &nbsp;<asp:Button ID="ButtonXG" runat="server" Text="完成" Height="30px" Width="80px" OnClick="ButtonXG_Click" />

                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
