<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script type="text/javascript">
$.fn.datebox.defaults.formatter = function(value){
	var date = new Date(value);
	var y = date.getFullYear();
	var m = date.getMonth()+1;
	var d = date.getDate();
	return y+'-'+m+'-'+d;
}

/*表单验证*/
/*验证班级姓名*/
function checkClassName(){
	var myinput1=$(".myinput1").val();
	if(myinput1!=""){
		var reg=/[u4e00-u9fa5]/;      //定义正则表达式
		if(reg.test(myinput1)){
			$("#classnameNotice").text(" √").css("color","green");
			return true;
		}else{
			$("#classnameNotice").text(" x").css("color","red");
			return false;
		}
	}else{
		$("#classnameNotice").text(" x").css("color","red");
		return false;
	}
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
			$("#classNumberNotice").text(" x").css("color","red");
			return false;
		}
	}else{
		$("#classNumberNotice").text(" x").css("color","red");
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
		$("#classTimeNotice").text(" x").css("color","red");
		return false;
	}
}

	$(function(){
		$("#upd").click(function(){
			if(checkClassName()&&checkClassNumber()&&checkClassTime()){
			var $form = $("form").serialize();
			$form = decodeURIComponent($form,true);
			//alert($form);
			$.ajax({
				type:"post",
				url:"updateClass.s",
				data:$form,
				success:function(data){
					if(data>0){
						parent.$("#close").val("1");   //传递给父页面的值
						window.parent.location.reload(); //刷新父页面
						//关闭弹层
						var index = parent.layer.getFrameIndex(window.name); //获取窗口索引  
			            parent.layer.close(index);
			            $('#dg').datagrid("reload");
			            
					  }else{
						  parent.$("#close").val("0");
						  
					  }
				}
			});
		 }
			
		});
	});
</script>
</head>
<body>
<div title="class" style="padding: 20px;">
		<form method="post" style="margin-top: 20px; margin-left: 30px;">
         班级编号：<input onblur="checkClassId()" class="myinput" name="classid" value="${tbClass.classid }" type="text" required="required" readonly="readonly"/><span id="classIdNotice"></span>
        <br/> <br/>
         班级名称：<input onblur="checkClassName()" class="myinput1" name="classname" value="${tbClass.classname }" type="text" required="required"/><span id="classnameNotice"></span>
        <br/> <br/>
        班级人数：<input onblur="checkClassNumber()" class="myinput2" name="totalnum" value="${tbClass.totalnum }" type="number" required="true" min="20"/><span id="classNumberNotice"></span>
       
        <br/> <br/>
        开班时间：<input onblur="checkClassTime()" class="myinput3" name="beginyear" value="${tbClass.beginyear }" type="text" required="true"/><span id="classTimeNotice"></span>
        <br/> <br/>
        班级类型：<!--<c:if test="${tbClass.classtype==1}">
            <input class="myinput4" name="classtype" value="java" type="text" required="true"/>
        </c:if>
        <c:if test="${tbClass.classtype==0}">
            <input class="myinput4" name="classtype" value="ui" type="text" required="true"/>
        </c:if>
         <input class="myinput4" name="classtype" value="${tbClass.classtype}" type="text" required="true"/> -->
        
        <c:if test="${tbClass.classtype==1 }">
            <input type="radio" class="" name="classtype" value="1" checked="checked">java
            <input type="radio" class="" name="classtype" value="0">ui
        </c:if>
        <c:if test="${tbClass.classtype==0 }">
            <input type="radio" class="" name="classtype" value="1" >java
            <input type="radio" class="" name="classtype" value="0" checked="checked">ui
        </c:if>
        
        <br/> <br/>
        <input id="upd" type="button" name="button" value="修改" style="margin-left:85px; background-color: #1E9FFF; width: 60px; height: 30px; color: white; font-size: 16px; border-radius: 4px; border: none;">
    </form>
	</div>
</body>
</html>
