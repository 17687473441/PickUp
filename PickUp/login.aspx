<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="loginANDregister_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="../css/login/style.css"/>
    <title></title>
</head>
<body style="background: rgba(0,0,0,0.05);">
    <form id="form1" runat="server">
        <div style="width: 100%; height: 100%;">
			<div class="login-wrap" style="margin: 0 auto">
				<h2>登录</h2>
				<div class="form">

					<input type="text" placeholder="手机号" name="un" runat="server" id="username"/>
                    
					<input type="password" placeholder="密码" name="pw" runat="server" id="psw"/>

                    <asp:Button ID="btnlogin" runat="server" Text="登录" class="btn" OnClick="Button1_Click"/>
					<br />
                    <asp:Label ID="Labeleroor" runat="server" ForeColor="Red" class="label"></asp:Label>
                    <br />
					<a href="register.aspx"> <p>没有账号？点击注册 </p></a>
				</div>
	
			</div>
		</div>
    </form>
</body>
</html>
