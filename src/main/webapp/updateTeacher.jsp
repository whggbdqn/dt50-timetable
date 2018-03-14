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
		readParent();  
		
		
		/*调用函数直接判断*/
		checkteachername();
		checkteacherintime();
		checkteacherpwd();
		checkteacherjobnumber();
		
		
		/*修改*/
		$("#up").click(function(){
			if(checkteachername()&&checkteacherjobnumber()&&checkteacherpwd()&&checkteacherphone()){
				$.post("updateTeacher.s",$("form").serialize(),function(data){
						if(!(data==null)){
							updateRow(data,$("#index").val());
							$.messager.show({
								title:'提示信息',
								msg:'修改成功',
								width:200,
								timeout:500,
								showSpeed:500,
								showType:null,
							 	style:{
							    }
							});
							go_dlg();   //调用父层的方法关闭
						}else{
							$.messager.show({
								title:'提示信息',
								msg:'修改失败',
								width:200,
								timeout:500,
								showSpeed:500,
								showType:null,
							 	style:{
							    }
							});
							go_dlg();   //调用父层的方法关闭
						}
				 }); 
			}else{
				$.messager.alert('提示信息','请验证');
			}
				
		});
		
	});
	
	function readParent(){
				//给子页面的表单传值
				$("input[name='teacherid']").val( $("#handle_status"+6).val());
				$("input[name='teachername']").val( $("#handle_status"+0).val());
				$("input[name='teacherjobnumber']").val( $("#handle_status"+1).val());
				/*$("input[name='teacherintime']").val( $("#handle_status"+4).val());*/
			/* 	$("input[name='teacherpwd']").val($("#handle_status"+7).val()); */
				 var now = new Date() ;
        
			    var nowYear = now.getFullYear() ; //年
			    var nowMonth = now.getMonth()+1<10?"0"+(now.getMonth()+1):now.getMonth() ; //月
			    var nowDay = now.getDate()<10?"0"+now.getDate():now.getDate() ; //日期
				//拼装完整日期格式
	         	 var nowDate = nowYear+"-"+nowMonth+"-"+nowDay ;
	            $("#teacherintime").val(nowDate);
				$("input[name='teacherphone']").val( $("#handle_status"+8).val());
				
	   }

	
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
	
	
	/*验证日期*/
	function checkteacherintime(){
		var teacherphone=$("#teacherintime").val();
		if(!teacherphone==null){
			return true;
		}else{
			$("teacherintimeNotice").text("日期不能为空").css("color","red");
			return false;
		}
	}
	
	/*验证密码*/
	 function checkteacherpwd(){
		var teacherpwd=$("#teacherpwd").val();
		var reg=/^(\w){3,4}$/;  //验证密码只能是3-6位数的数字或者字母
		if(reg.test(teacherpwd)){
			$("#teacherpwdNotice").text("✔").css("color","blue");
			return true;
		}
		else{
			$("#teacherpwdNotice").text("密码三到六位数数字").css("color","red");
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
	
	
	</script>
	<center style="font-size: 18px;">
		<h4>教员修改页面</h4>
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
<div id="child">
	<form method="post">
		<input type="hidden" name="teacherid" /> 教员姓名:<input type="text"
			id="teachername" name="teachername" onblur="checkteachername();" />
		<span id="teachernameNotice"></span><br />
		<div style="margin-bottom: 10px;"></div>
		教员工号:<input type="text" name="teacherjobnumber" id="teacherjobnumber"
			onblur="checkteacherjobnumber();" /> <span id="number"
			style="color: red;">(工号为4位数数字)</span><span
			id="teacherjobnumberNotice"></span>
		<div style="margin-bottom: 10px;"></div>
		教员密码:<input type="password" name="teacherpwd" id="teacherpwd"
			onblur="checkteacherpwd();" /><span id="teacherpwdNotice"></span>
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
			onblur="checkteacherintime();"></input><span id="teacherintimeNotice"></span>
		<div style="margin-bottom: 10px;"></div>
		教员性别: <input type="radio" name="teachersex" value="0" />女 <input
			type="radio" name="teachersex" value="1" checked="checked" />男
		<div style="margin-bottom: 10px;"></div>
		<input type="button" value="修改教员信息" style="height: 30px;" id="up">
	</form>
</div>
</div>	
</body>
</html>