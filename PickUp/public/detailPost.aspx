<%@ Page Language="C#" AutoEventWireup="true" CodeFile="detailPost.aspx.cs" Inherits="queryPost" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="../css/onePost.css" />
    <link rel="stylesheet" href="../css/font/iconfont.css" />
    <script src="../js/jquery.min.js"></script>
    <script> 
        $(document).ready(function () {
            $(".reply").click(function () {
                $(".replyPanel").slideToggle("slow");
                    console.log($(".reply").length);
            });
        });
        
 
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connStr %>" SelectCommand="select postid,userid,pic,othername,sendtime,text,imgpath, pd from post,users where users.phone = post.userid"></asp:SqlDataSource>--%>

        <div class="row item_msg" style="width: 450px">
            <div class="col-sm-12 col-xs-12 message" style="border-bottom: 1px solid #e2e2e2">
                <asp:FormView ID="FormView1" runat="server">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" class="col-sm-2 col-xs-2" Style="border-radius: 50%; box-sizing: border-box;" ImageUrl='<%#Eval("pic")%>' />
                        <div class="col-sm-10 col-xs-10">
                            <span style="font-weight: bold;"><%#Eval("othername")%></span>
                            <br>
                            <small class="date" style="color: #999"><%#Eval("sendtime")%></small>
                            <div class="msg_content">
                                <%#Eval("text")%>
                                <br />
                                <asp:Image ID="Image2" runat="server" class="mypic" ImageUrl='<%#Eval("imgpath")%>' />
                            </div>
                        </div>
                        <%--<div class="icon-box">
                            <a href="#"><span class="icon iconfont icon-dianzan"><span> 12</span></span></a>
                            <a href="#"><span class="icon iconfont icon-pinglun1"><span>  12</span></span></a>
                            <a href="#"><span class="icon iconfont icon-fenxiang"><span> 12</span></span></a>
                        </div>--%>
                        <input type="text" name="postId" value='<%#Eval("postid")%>' style="display: none" />
                        <input type="text" name="postUserid" value='<%#Eval("userid")%>' style="display: none" />
                        </div>                           
                    </ItemTemplate>
                </asp:FormView>
                <%--发表评论--%>
                <div style="padding: 10px; width: 100%; background: #e2e2e2">
                    <div class="" style="width: 40px; height: 40px; display: inline-block;">
                        <div id="" style="width: 40px; height: 40px;">
                            <asp:ImageButton ID="pic" runat="server" ImageUrl="~/img/default_face.jpg" Style="border-radius: 50%; width: 100%; height: 100%" />
                        </div>
                    </div>
                    <div style="width: 394px; margin-left: 15px; height: 40px; display: inline-block; position: fixed;">

                        <textarea name="commentText" style="height: 30px; width: 95%; resize: none" placeholder="吐槽一下"></textarea>
                        <%--<div class="icon-box">
                            <a href="#"><span class="icon iconfont icon-dianzan"><span> 12</span></span></a>
                            <a href="#"><span class="icon iconfont icon-pinglun1"><span>  12</span></span></a>
                            <a href="#"><span class="icon iconfont icon-fenxiang"><span> 12</span></span></a>
                        </div>--%>
                    </div>
                    <div class="" style="width: 100%; height: 30px; text-align: right;">
                        <asp:Button ID="Button1" runat="server" Text="发表" Style="height: 100%; width: 50px;" OnClick="Button1_Click" />
                    </div>
                </div>
                <%--一级评论区--%>
                <div style="border-bottom: 1px solid #999; padding: 10px; width: 100%; font-size: 13px">
                    <asp:GridView ID="GridViewComment" runat="server" AutoGenerateColumns="False" GridLines="None" OnRowDataBound="GridViewComment_RowDataBound" DataKeyNames="comid" ShowHeader="False">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <div style="padding-bottom: 5px; border-bottom: 1px solid #e2e2e2; margin-top: 5px">
                                        <div class="" style="width: 30px; height: 30px; display: inline-block; position: fixed; margin-top: 0;">
                                            <div id="" style="width: 30px; height: 30px;">
                                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%#Eval("pic") %>' Style="border-radius: 50%; width: 100%; height: 100%" />
                                            </div>
                                        </div>

                                        <div style="width: 394px; margin-left: 50px; height: auto; display: inline-block;">
                                            <b style="color: orangered"><%#Eval("othername") %>：</b>

                                            <%#Eval("comtext") %>
                                            <div style="width: 100%; height: 20px; margin-top: 5px; color: #999; font-size: 12px">
                                                <div style="float: right;">
                                                    <a href="#" style="padding-right: 5px; border-right: 1px solid #999;" class="reply">回复</a>
                                                    <a href="#">点赞</a>
                                                </div>
                                                <div>
                                                    <%#Eval("comtime") %>
                                                </div>
                                            </div>
                                        </div>
                                        <input type="text" name="beforeid" value='<%#Eval("userid")%>' style="display: none" />
                                        <%--弹出评论回复框--%>

                                        <div style="display: none; margin-top: 5px" class="replyPanel">
                                            <div style="width: 394px; margin-left: 15px; height: 30px; display: inline-block; position: fixed;">
                                                <textarea name="replytext" style="height: 20px; width: 95%; resize: none; background: none" placeholder='回复：<%#Eval("othername")%>'></textarea>
                                            </div>
                                            <div class="" style="width: 100%; height: 25px; text-align: right;">
                                                <asp:Button ID="ButtonReply" name="ButtonReply" runat="server" Text="回复" Style="height: 100%; width: 50px;" OnClick="ButtonReply_Click" CommandArgument='<%#Eval("comid") %>' />
                                                <%--<asp:Button ID="Button2" name="firstComName" style="display:none" runat="server" CommandArgument='<%#Eval("othername") %>'/>--%>
                                                <%--<input name="firstComName" style="display:none" value='<%#Eval("othername") %>'/>--%>
                                            </div>

                                        </div>
                                        
                                        <%--二级评论--%>
                                        <%--select comment.*,users.pic,users.othername from comment,users where users.phone = comment.userid and postid =<%#Eval("psotid") %>  and beforeid=<%#Eval("comid") %> order by comtime desc;--%>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connStr %>" SelectCommand=''></asp:SqlDataSource>
                                        <asp:GridView ID="GridViewReply" runat="server" AutoGenerateColumns="False" GridLines="None" Style="background-color: #e2e2e2;" DataSourceID="SqlDataSource1">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <div style="width: 394px; margin-left: 70px; height: auto; display: inline-block; padding-left: 10px; font-size: 12px">
                                                            <b style="color: red"><%#Eval("othername") %></b>
                                                            @ <%#Eval("beforeid") %>：
                                                                <%#Eval("comtext") %>
                                                            <div style="width: 100%; height: 20px; margin-top: 5px; color: #999; font-size: 11px">
                                                                <%--<div style="float: right; margin-right: 20px">
                                                                    <a href="#" style="padding-right: 5px; border-right: 1px solid #999;" id="reply">回复</a>
                                                                    <a href="#">点赞</a>
                                                                </div>--%>
                                                                <div>
                                                                    <%#Eval("comtime") %>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>


                                    </div>


                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                </div>

            </div>
        </div>
    </form>
</body>
</html>
