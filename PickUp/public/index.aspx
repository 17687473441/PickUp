<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="public_index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="../css/postbar/style.css" />
	<link rel="stylesheet" href="../css/style.css" />
	<link rel="stylesheet" href="../css/nav.css" />
	<link rel="stylesheet" href="../css/轮播/swiper.css" />
	<link rel="stylesheet" href="../css/轮播/style.css" />
	<link rel="stylesheet" href="../css/text/style.css" />
	<link rel="stylesheet" href="../css/commonstyle.css" />
	
	<style type="text/css">
		.d1{
			width: 200px;
			height: 40px;
			padding-left: 10px;
			border: 2px solid yellowgreen;
			border-radius: 5px;
			outline: none;
			background: #F9F0DA;
			color: #9E9C9C;
			margin-left:150px;
		}
		.d2{
			height: 40px;
			width:40px;
			padding:5px;
			margin-left:10px;
			border: 2px solid yellowgreen;
			border-radius: 5px;
			outline: none;
			background: #F9F0DA;
			color: #9E9C9C;
		}
		.nav-active{
			background-color:yellowgreen;
			border-radius: 10em;
		}
		
	</style>

</head>
<body>
    <form id="form1" runat="server">
        <!--头部-->
	<div id="nav-1">
		<ul class="nav">
			<li class="slide1" style="left: 15px; width: 100px;"></li>
			<li class="slide2"></li>
			<li><a class="active" href="#">首页</a></li>
			<li><a href="#" target="_top">发现</a></li>
			<li><a href="../login.aspx" target="_top">登录</a></li>
			<li><a href="../register.aspx">注册</a></li>
			<li><a href="../personCtrl.aspx">个人中心</a></li>
			<li>									
                <asp:TextBox class="d1" ID="TextBoxSearch" runat="server" ToolTip="输入搜索内容..." placeholder="输入搜索内容...">
					
                </asp:TextBox>											
			</li>
			<li>	
					<asp:ImageButton class="d2" ID="btnSearch" runat="server" ImageUrl="~/img/search.png" Width="40px" OnClick="search"/>	                										
			</li>
			<li>
				<div style="width: 40px;height: 40px;border-radius: 50%;margin-left: 500px;">					
                    <asp:ImageButton ID="pic" runat="server" ImageUrl="~/img/default_face.jpg" style="border-radius: 50%;width:100%; height:100%" OnClick="pic_Click"/>
				</div>
			</li>
		</ul>
	</div>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/script.js"></script>


	<div style="margin:0 auto;width:max-content;margin-top:100px" >
		<!--导航-->
		<div style="position: relative;width:130px;float:left;">
			<nav>
				<ul class="nav">
					<li>
						<asp:LinkButton ID="LBRM" runat="server" OnClick="LinkButton1_Click">全部</asp:LinkButton>
					</li>
					<li>
						<asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton1_Click">榜单</asp:LinkButton>
					</li>
					<li>
						<asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton1_Click">军事</asp:LinkButton>
					</li>
					<li>
						<asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton1_Click">社会</asp:LinkButton>
					</li>
					<li>
						<asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton1_Click">搞笑</asp:LinkButton>
					</li>
					<li>
						<asp:LinkButton ID="LBQG" runat="server" OnClick="LinkButton1_Click">情感</asp:LinkButton>

					</li>
					<li>
						<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">时尚</asp:LinkButton>
					</li>
					<li>
						<asp:LinkButton ID="LinkButton6" runat="server" OnClick="LinkButton1_Click">美女</asp:LinkButton>
					</li>
					<li>
						<asp:LinkButton ID="LinkButton7" runat="server" OnClick="LinkButton1_Click">游戏</asp:LinkButton>
					</li>
					<li>
						<asp:LinkButton ID="LinkButton8" runat="server" OnClick="LinkButton1_Click">科技</asp:LinkButton>
					</li>
				</ul>

			
			</nav>
		
		</div>
		<!--帖子区域-->
		<div style="width: 700px;height:auto;background-color:#666;position:relative;display:inline-block;margin-left:50px">
			<div class="wrapper" style="margin-top:-90px; margin-left: 20px;">
				<div class="swiper-container swiper-container">
					<div class="swiper-wrapper" style="height: 350px;">
						<div class="swiper-slide"><img src="../img/轮播/carrot.jpg" alt=""/></div>
						<div class="swiper-slide"><img src="../img/轮播/eggplant.jpg" alt=""/></div>
						<div class="swiper-slide"><img src="../img/轮播/broccoli.jpg" alt=""/></div>
						<div class="swiper-slide"><img src="../img/轮播/1.jpg" alt=""/></div>
					</div>
					<!-- 追記 -->
					<div class="swiper-pagination"></div>
				</div>
			</div>
			<script src="../js/轮播/swiper.js"></script>
			<script src="../js/轮播/script.js"></script>
			<div style="width: 610px;margin-top: 20px;margin-left: 80px;">
			<iframe src="../queryPost.aspx"  name="main" id="mainFrame" title="mainFrame" style="width:100%" onload="reinitIframe()" frameborder="0" scrolling="no">
			</iframe>
				<script type="text/javascript">
					function reinitIframe() {

						var iframe = document.getElementById("mainFrame");

						iframe.height = 0; //只有先设置原来的iframe高度为0，之前的iframe高度才不会对现在的设置有影响
						try {
							var bHeight = iframe.contentWindow.document.body.scrollHeight;
							var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
							var height = Math.max(bHeight, dHeight);
							iframe.height = height;
							console.log(height);
						} catch (ex) { }
					}
					/*window.setInterval("reinitIframe()", 200);*/
				</script>

			</div>

		</div>

		<div class="hotTopic">
			<div style="border-bottom:1px solid #999;padding-bottom:5px">
				<a href="#">热门话题</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#">换一换</a>
			</div>
			<div style="margin-top:15px">
				<a href="#">#你认为字母哥垫脚了吗#</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span>1854</span>
			</div>
			<div style="margin-top:15px">
				<a href="#">#你认为字母哥垫脚了吗#</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span>1854</span>
			</div>
			<div style="margin-top:15px">
				<a href="#">#你认为字母哥垫脚了吗#</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span>1854</span>
			</div>
			<div style="margin-top:15px">
				<a href="#">#你认为字母哥垫脚了吗#</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span>1854</span>
			</div>
			<div style="margin-top:15px">
				<a href="#">#你认为字母哥垫脚了吗#</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span>1854</span>
			</div>
			<div style="margin-top:15px">
				<a href="#">#你认为字母哥垫脚了吗#</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span>1854</span>
			</div>
			<div style="margin-top:15px">
				<a href="#">#你认为字母哥垫脚了吗#</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span>1854</span>
			</div>
			<div style="margin-top:15px">
				<a href="#">#你认为字母哥垫脚了吗#</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span>1854</span>
			</div>
			<div>

			</div>
		</div>
	</div>
		<div style="width:100%;height:50px;background-color:blue;margin-top:200px;position:relative">
			<!--公共底部-->
	<div class="footer">
		<div class="footerinner">
			<ul class="share">
				<li>
					<img class="weibo_icon" src="../img/share1.png" alt="">
				</li>
				<li>
					<img class="qq_icon" src="../img/share2.png" alt="">
				</li>
				<li>
					<img class="wechat_icon" src="../img/share4.png" alt="">
				</li>
			</ul>
			<div class="code_wrap">
				<ul class="code">
					<li><img class="weibo" src="../img/weibo1.png" alt=""></li>
					<li><img class="qq" src="../img/qq1.png" alt=""></li>
					<li><img class="wechat" src="../img/wechat1.png" alt=""></li>
				</ul>
			</div>
			<div class="footerinfo">
				<div class="footerinfoTop">
					<p>Telephone:&nbsp;17687473441</p>
					<p>Email：&nbsp;1825237186@qq.com</p>
					<p>广西省崇左市江州区广西民族师范学院</p>
				</div>
				<div class="footerinfoBottom">							
					<p>你迦哥的PickUp社区咨询有限公司</p>
				</div>
			</div>
		</div>
	</div>
	<script>
        /*底部二维码*/

        $(".weibo_icon").hover(function () {
            $(".weibo").fadeIn(500);
            $(".qq,.twitter,.wechat").fadeOut(0);
            $(".code_wrap").css("z-index", 200);
        }, function () {
            $(".weibo").fadeOut(0);
            $(".code_wrap").css("z-index", 50);
        });

        $(".qq_icon").hover(function () {
            $(".qq").fadeIn(500);
            $(".weibo,.twitter,.wechat").fadeOut(0);
            $(".code_wrap").css("z-index", 200);
        }, function () {
            $(".qq").fadeOut(0);
            $(".code_wrap").css("z-index", 50);
        });
        
        $(".wechat_icon").hover(function () {
            $(".wechat").fadeIn(500);
            $(".weibo,.qq,.twitter").fadeOut(0);
            $(".code_wrap").css("z-index", 200);
        }, function () {
            $(".wechat").fadeOut(0);
            $(".code_wrap").css("z-index", 50);
        });
      

    </script>
		</div>
    </form>
</body>
		<script>
		function Color(elem) {
			this.elem = elem;
			this.colors = ["#1abc9c", "#f1c40f", "#9b59b6", "#f39c12"];
			this.run = function() {
				setInterval(
					function() {

						var i = Math.floor(Math.random() * this.colors.length);
						this.elem.style.backgroundColor = this.colors[i];
					}.bind(this),
					2000
				);

			};
		}
		var obj = new Color(document.body)
		obj.run();
	</script>
</html>
