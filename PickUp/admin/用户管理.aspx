<%@ Page Language="C#" AutoEventWireup="true" CodeFile="用户管理.aspx.cs" Inherits="admin_用户管理" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="phone" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="1000px">
                <Columns>
                    <asp:BoundField DataField="phone" HeaderText="账号" ReadOnly="True" SortExpression="phone" />
                    <asp:BoundField DataField="psw" HeaderText="密码" SortExpression="psw" />
                    <asp:BoundField DataField="othername" HeaderText="昵称" SortExpression="othername" />
                    <asp:TemplateField HeaderText="头像">                         
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" style="border-radius: 50%;width:50px;height:50px; box-sizing: border-box;" ImageUrl='<%#Eval("pic")%>'/>
                        </ItemTemplate>                         
                    </asp:TemplateField>
                    <asp:BoundField DataField="signword" HeaderText="个性签名" SortExpression="signword" />
                    <asp:BoundField DataField="sex" HeaderText="性别" SortExpression="sex" />
                    <asp:BoundField DataField="birthday" HeaderText="出生年月" SortExpression="birthday" />
                    <asp:BoundField DataField="mb1" HeaderText="密保答案1" SortExpression="mb1" />
                    <asp:BoundField DataField="mb2" HeaderText="密保答案2" SortExpression="mb2" />
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>                        
                            <asp:LinkButton ID="lkbt_delete" runat="server" CommandArgument='<%#Eval("phone") %>' OnClick="lkbt_delete_Click">删除</asp:LinkButton>
                        </ItemTemplate>                        
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connStr %>" SelectCommand="SELECT * FROM [users]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
