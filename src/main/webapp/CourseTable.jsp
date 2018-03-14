<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
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
<script type="text/javascript">
$(function(){
	//显示风格
	$("#ptable tr:eq(0)").css("background-color","#BBDEF9");//odd为奇数
	$("#ptable tr:eq(1)").css("background-color","#BBDEF9");//odd为奇数
	$("#ptable tr:gt(1)").css("background-color","#F1F1F1");
	/* var old;
	$("#ptable tr:gt(0)").mouseover(function(){
	old=$(this).css("background-color");
	$(this).css("background-color","#FFFFA6");
	});
	$("#ptable tr:gt(0)").mouseout(function(){
	$(this).css("background-color",old);
	}); */
	
	
});

</script>
</head>
<body>
<table border=1 cellspacing="0" width="87%" id="ptable" cellpadding="3" align="center">
		<tr>
			<td rowspan="2" align="center">日期</td>
			<td rowspan="2" align="center">教室</td>
			<td colspan="3" align="center">上午8:30-10:30</td>
			<td colspan="3" align="center">上午10:30-12:30</td>
			<td colspan="3" align="center">下午2:00-4:00</td>
			<td colspan="3" align="center">下午4:00-6:00</td>
			<td colspan="3" align="center">晚上6:30-8:30</td>
		</tr>
		<tr>
			<td>班级</td>
			<td>教师姓名</td>
			<td>课程内容</td>
			<td>班级</td>
			<td>教师姓名</td>
			<td>课程内容</td>
			<td>班级</td>
			<td>教师姓名</td>
			<td>课程内容</td>
			<td>班级</td>
			<td>教师姓名</td>
			<td>课程内容</td>
			<td>班级</td>
			<td>教师姓名</td>
			<td>课程内容</td>
		   
		</tr>
		<c:forEach items="${dates}" var="date">
		<c:forEach items="${date.tbCourseTable}" var="s" varStatus="state">
		<tr>
		<!--贼重要 的if判断-->
		<c:if test="${state.index==0}">
	     <td rowspan="${date.count}">${date.cDatetime}</td>	
			</c:if>
			<td>${s.cClassromm}</td>
			<td>${s.cMorning1Class}</td>
			<td>${s.cMorning1Teacher}</td>
			<td>${s.cMorning1Course}</td>
			<td>${s.cMorning2Class}</td>
			<td>${s.cMorning2Teacher}</td>
			<td>${s.cMorning2Course}</td>
			<td>${s.cAfternoon1Class}</td>
			<td>${s.cAfternoon1Teacher}</td>
			<td>${s.cAfternoon1Course}</td>
			<td>${s.cAfternoon2Class}</td>
			<td>${s.cAfternoon2Teacher}</td>
			<td>${s.cAfternoon2Course}</td>
			<td>${s.cEveningClass}</td>
			<td>${s.cEveningTeacher}</td>
			<td>${s.cEveningCourse}</td>
			
		</tr>
		</c:forEach>
		
</c:forEach>


	</table>
	<br>
	<br>
	<br>
	
	
	<center>
	 <a id="btn" href="javascript:window.opener=null;window.open('','_self');window.close();" class="easyui-linkbutton" data-options="iconCls:'icon-back'">返回</a>   
	<a id="btn" href="downloadCourseExcel.s" class="easyui-linkbutton" data-options="iconCls:'icon-excel'">导出</a>
	<a id="btn" href="javascript:$.messager.confirm('确认','你确认想要删除课表吗？',function(r){
	if(r) location.href='deletetable.s';
	})" class="easyui-linkbutton" data-options="iconCls:'icon-clear'">删除</a>  
	</center>
</body>
</html>