<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<!--导入EasyUI-->
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
	
 <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css"> 
 <!--layui包<link rel="stylesheet" href="layui/css/layui.css"  media="all">-->
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>

<script>
/*表单验证*/
/*验证班级姓名*/
function checkClassName(callback){
	var myinput1=$(".myinput1").val();
	if(myinput1!=""){
		var reg=/[u4e00-u9fa5]/;      //定义正则表达式
		if(reg.test(myinput1)){
			validClassName(callback);			
		}else{
			$("#classnameNotice").text(" ×").css("color","red");
			return false;
		}
	}else{
		$("#classnameNotice").text(" ×").css("color","red");
		return false;
	}
}

function validClassName(callback){	
	
	var myinput1=$(".myinput1").val();
	$.post("getOneClassName.s",{"className":myinput1},function(data){
		
		if(data<1){
			$("#classnameNotice").text(" √").css("color","green");
			callback();
		}else{
			$("#classnameNotice").text(" 已存在").css("color","red");
		}
	});	
}

/*验证班级总人数*/
function checkClassNumber(){
	var myinput2=$(".myinput2").val();
	if(myinput2!=""){
		var reg=/[u4e00-u9fa5]/;      //定义正则表达式
		if(reg.test(myinput2)){
			$("#classNumberNotice").text(" √").css("color","green");
			return true;
		}else{
			$("#classNumberNotice").text(" ×").css("color","red");
			return false;
		}
	}else{
		$("#classNumberNotice").text(" ×").css("color","red");
		return false;
	}
}
/*验证日期*/
function checkClassTime(){
	var myinput3=$(".myinput3").val();
	if(myinput3!=""){
		$("#classTimeNotice").text(" √").css("color","green");
		return true;
	}else{
		$("#classTimeNotice").text(" ×").css("color","red");
		return false;
	}
}

/*验证所有*/
 $(function(){
		//异步添加
		$("#add").click(function(){
			if(checkClassNumber()&&checkClassTime()){
				checkClassName(function(){
			var $form = $("form").serialize();
			$form = decodeURIComponent($form,true);
			$.ajax({
				type:"post",
				url:"addClass.s",
				data:$form,
				success:function(data){
					if(data>0){
						parent.$("#close").val("1");   //传递给父页面的值
						//关闭弹层
						var index = parent.layer.getFrameIndex(window.name); //获取窗口索引 
						parent.layer.close(index); 
			            $('#dg').datagrid("reload");
			            //parent.location.reload(); // 父页面刷新  
					  } else{
						  parent.$("#close").val("0");
					  } 
				},
				error:function(data){
					$.messager.alert('添加失败');
				}
			});
		 });
			};
		});
	
 });
</script>
</head>
<body>
		<form method="post" style="margin-top: 20px; margin-left: 30px;">
        班级名称：<input class="myinput1" name="classname" type="text" required="required" onblur="checkClassName()"/><span id="classnameNotice"></span>
        <br/> <br/>
        班级人数：<input class="myinput2" value="30" name="totalnum" type="number" required="true" min="20" onblur="checkClassNumber()"/><span id="classNumberNotice"></span>
        <br/> <br/>
        开班时间：<input class="myinput3" name="beginyear" type="date" required="true" onblur="checkClassTime()"/><span id="classTimeNotice"></span>
        <br/> <br/>
        班级类型：
        <select class="myinput4" name="classtype" required="true">
        	<option value="0">ui</option>
        	<option value="1">java</option>
        </select>
        <br/> <br/>
        <input id="add" type="button" name="button" value="添加" style="margin-left:85px; background-color: #1E9FFF; width: 60px; height: 30px; color: white; font-size: 16px; border-radius: 4px; border: none;">
    </form>
</body>
</html>

