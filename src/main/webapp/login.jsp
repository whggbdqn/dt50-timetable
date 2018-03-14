<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>login</title>
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/captha.css" />
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="css/component.css" />
<!--[if IE]>
<script src="js/html5.js"></script>
<![endif]-->
<style>
.invalid:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
    color: red;  
}

.invalid::-moz-placeholder { /* Mozilla Firefox 19+ */
    color: red;
}

input.invalid:-ms-input-placeholder{
    color: red;
}

input.invalid::-webkit-input-placeholder {
    color: red;
}
</style>
</head>
<body>	
		<div class="container demo-1">
			<div class="content">
				<div id="large-header" class="large-header">
					<canvas id="demo-canvas"></canvas>
					<div class="logo_box">
						<a class="hh"><h3>北大青鸟智能排课系统</h3></a>
						<form method="post" id="form">
							<div class="input_outer">
								<span class="u_user"></span>
								<input name="username" id="uname" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入用户名" >
							</div>
							<div class="input_outer">
								<span class="us_uer"></span>
								<input name="password" id="upwd" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;"value="" type="password" placeholder="请输入3-6位密码">
								
							</div>
							<div class="input_outer" style="postion:relative" hidden="hidden" id="captha">
								<span class="us_uer"></span>
								<input id="inputCode" class="text" name="code" placeholder="请输入验证码"><img src="code.jsp" id="safeCode" style="position:absolute;right:0px;top:10px"/>
							<div>
							<div><a href="#" id="safeCode1" style="padding-left:50px;color:#80FF00">看不清换一张</a></div>
 							</div>
							</div>
							<div class="mb2"><input type="button" id="submit" class="act-but submit"  style="color: #FFFFFF;width:330px" value="登录"></div>
						</form>
					</div>
				</div>
			</div>
		</div><!-- /container -->
		<script src="js/TweenLite.min.js"></script>
		<script src="js/EasePack.min.js"></script>
		<script src="js/rAF.js"></script>
		<script src="js/demo-1.js"></script>
		<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
		<div style="text-align:center;">
		
</div>
<script type="text/javascript">





	
	
		
	$(function(){
		$("#safeCode").click(function(){
	        $("#safeCode").attr("src","code.jsp?id="+Math.random());
	    });
		$("#safeCode1").click(function(){
	        $("#safeCode").attr("src","code.jsp?id="+Math.random());
	    });
		$("#upwd").focus(function(){
			$("#captha").removeAttr("hidden");
		})
	$("#submit").click(function(){
			var code=$("#inputCode").val();
			var uname=$("#uname").val();
			var upwd=$("#upwd").val();
			
			if((uname=="")||(upwd=="")){
				alert("用户名或密码不能为空");
			}else {
				$.ajax({
					type:"post",
					url:"login.s",
					data:{"uname":uname,"upwd":upwd,"inputCode":code},
					success:function(data){
						if(data=="1"){
							alert("用户名或密码错误")
						}else if(data=="2"){
							window.location.href="getMenu.s";
						}else if(data=="3"){
							alert("验证码错误")
						}
					},
		
				});
			}
		})
		$("#form").keydown(function(e){
			 var e = e || event,
			 keycode = e.which || e.keyCode;
			 if (keycode==13) {
			 $("#submit").trigger("click");
			 }
			});
		
	})
</script>
	</body>
	
</html>