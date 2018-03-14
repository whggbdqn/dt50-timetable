<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script src="js/jquery-1.8.3.min.js"></script>

</head>
<body>
	<script type="text/javascript">
	 $(function(){
		 //回车控件
		 $("#form").keydown(function(e){
			 var e=e||event,
			 keycode= e.which||e.keyCode;
			 if(keycode==13){
				 $("#add").click();
			 }
		 });
		 
		 
		//异步添加
		$("#add").click(function(){
			if(checkteacherphone()&&checkteachername()&&checkteacherjobnumber()){
				  $.post("addTeacher.s",$("form").serialize(),function(data){
						if(!(data==null)){
							/*调用父页面的函数给表格传值*/
							add(data);
							$.messager.show({
								title:'提示信息',
								msg:'添加成功',
								width:200,
								timeout:1000,
								showSpeed:1000,
								showType:null,
							 	style:{
							    }
							});
							go_dlg();   //调用父层的方法关闭
						}else{
							$.messager.show({
								title:'提示信息',
								msg:'添加失败',
								width:200,
								timeout:1000,
								showSpeed:1000,
								showType:null,
							 	style:{
							    }
							});
							go_dlg();
						}
				 }); 
			}else{
				$.messager.alert('提示信息','请验证');
			}
					 
		});
		
	}); 
	
	
	/*表单验证*/
	/*验证教员姓名*/
	function checkteachername(){
		var teachername=$("#teachername").val();
		var reg=/^[\u4e00-\u9fa5]{2,4}$/;      //定义正则表达式
		if(reg.test(teachername)){
			$("#teachernameNotice").text("✔").css("color","blue");
			return true;
		}
		else{
			$("#teachernameNotice").text("✖").css("color","red");
			return false;
		}
	}
	
	
	/*验证员工工号*/
	function checkteacherjobnumber(){
		var teacherjobnumber=$("#teacherjobnumber").val();
		var reg=/^[0-9]{4}$/;      //定义正则表达式
		if(reg.test(teacherjobnumber)){
			$("#teacherjobnumberNotice").text("✔").css("color","blue");
			$("#number").text("");
			return true;
		}
		else{
			$("#teacherjobnumberNotice").text("✖").css("color","red");
			$("#number").text("(工号为4位数数字)");
			return false;
		}
	}
	
	
	
	/*验证电话号码*/
	function checkteacherphone(){
		var teacherphone=$("#teacherphone").val();
		var reg=/^1[34578]\d{9}$/;      //定义正则表达式
		if(reg.test(teacherphone)){
			$("#teacherphoneNotice").text("✔").css("color","blue");
			return true;
		}
		else{
			$("#teacherphoneNotice").text("✖").css("color","red");
			return false;
		}
	}
	
	/*验证日期*/
	function checkteacherintime(){
		var teacherphone=$("#teacherintime").val();
		if(!teacherphone==null){
			return true;
		}else{
			return false;
		}
	}
	
	
</script>
	<center style="font-size: 18px;">
		<h4>教员录入页面</h4>
	</center>
	<style type="text/css">
	input, select {
		margin: 10px;
	}
	#parent{
		position: relative;
	}
	#child{
		position: absolute;
		left: 50px;
	}
	</style>
<div id="parent">
<div  id="child">
	<form method="post" id="form">
		教员姓名:<input type="text" name="teachername" id="teachername"
			onblur="checkteachername();" /><span id="teachernameNotice"></span>
		<br />
		<div style="margin-bottom: 10px;"></div>

		教员工号:<input type="text" name="teacherjobnumber" id="teacherjobnumber"
			onblur="checkteacherjobnumber();" /><span id="number"
			style="color: red;">(工号为4位数数字)</span><span
			id="teacherjobnumberNotice"></span>
		<div style="margin-bottom: 10px;"></div>
		在职状态:<select name="teacherstate">
			<option value="1">在职</option>
			<option value="0">离职</option>
		</select><br>
		<div style="margin-bottom: 10px;"></div>
		员工电话:<input type="text" name="teacherphone" id="teacherphone"
			onblur="checkteacherphone();" /><span id="teacherphoneNotice"></span>
		<div style="margin-bottom: 10px;"></div>
		角色信息: <input type="radio" value="1" name="dutiesid" checked="checked" />教员
		<input type="radio" value="2" name="dutiesid" />班主任 <input
			type="radio" value="3" name="dutiesid" />排课老师 <input type="radio"
			value="4" name="dutiesid" />校长
		<div style="margin-bottom: 10px;"></div>
		入职时期: <input type="date" name="teacherintime" id="teacherintime"
			onblur="checkteacherintime();"></input><span
			id="teacherintimeNotice"></span>
		<div style="margin-bottom: 10px;"></div>
		教员性别: <input type="radio" name="teachersex" value="0"
			checked="checked" />女 <input type="radio" name="teachersex"
			value="1" />男
		<div style="margin-bottom: 10px;"></div>
		<h5 style=" font-weight:bolder;">注意:初始密码均为:123</h5>
		<div style="margin-bottom: 10px;"></div>
	</form>
	<input type="button" value="教员录入" style="height: 30px;width: 80px;" id="add" />

</div>
</div>
</body>

</html>

