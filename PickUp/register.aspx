<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="loginANDregister_register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
	<link rel="stylesheet" href="../css/login/style.css"/>
</head>
<body style="background: rgba(0,0,0,0.05);">
    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


        <div style="width: 100%; height: 100%;" >
			<div class="login-wrap" style="margin:0 auto">
		<h2>注册</h2>
		<div class="form">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="phone" Display="Dynamic" ErrorMessage="该项不能为空" Font-Size="10pt" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
				<ContentTemplate>
					<asp:Label ID="LabelInfo" runat="server" class="label" Font-Size="10pt" ForeColor="Red" Display="Dynamic" ></asp:Label>
				</ContentTemplate>
				<Triggers>
                    <asp:AsyncPostBackTrigger ControlID="phone" EventName="TextChanged" />
                </Triggers>
            </asp:UpdatePanel>
	
	
			
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ErrorMessage="请输入1开头的11位数字的手机号" ForeColor="Red" ControlToValidate="phone" ValidationExpression="^1[0-9]{10}$"></asp:RegularExpressionValidator>
	
	
			
            <br />
	
	
			
            <asp:TextBox placeholder="手机号" name="un" id="phone" runat="server" class="" OnTextChanged="phone_TextChanged" autocomplete="off" AutoPostBack="True"></asp:TextBox>

			<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="psw" Display="Dynamic" ErrorMessage="密码不能为空" Font-Size="10pt" ForeColor="Red"></asp:RequiredFieldValidator>

			<br />
			<input type="password" placeholder="密码" name="pw" id="psw" runat="server" autocomplete="off"/>
			<%--<input type="password" placeholder="确认密码" name="pw" id="repsw" runat="server" autocomplete="off"/>--%>
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="两次密码输入不一致" ControlToCompare="psw" ControlToValidate="repsw" Display="Dynamic" Font-Size="10pt" ForeColor="Red"></asp:CompareValidator>
			<br />
            <asp:TextBox ID="repsw" runat="server" placeholder="确认密码" name="pw" autocomplete="off" TextMode="Password"></asp:TextBox>
			<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="mb1" Display="Dynamic" ErrorMessage="密保答案不能为空" Font-Size="10pt" ForeColor="Red"></asp:RequiredFieldValidator>

			<br />
			<input type="text" placeholder="密保1：你妈妈的名字是？" name="mb1" id="mb1" runat="server" autocomplete="off"/><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="mb2" Display="Dynamic" ErrorMessage="密保答案不能为空" Font-Size="10pt" ForeColor="Red"></asp:RequiredFieldValidator>

			<br />
			<input type="text" placeholder="密保2：你爸爸的名字是？" name="mb2" id="mb2" runat="server" autocomplete="off"/>
            <asp:Button ID="btnregister" runat="server" Text=" 注册" class="btn" OnClick="btnregister_Click" />
			<!--<a href="#"> <p> 没有账号？点击注册 </p></a>-->
		</div>
	
	</div>
</div>


    </form>
</body>
</html>
