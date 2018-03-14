<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
</head>
<body>
	<table class="easyui-datagrid"  style="width:700px"  
        data-options="title:'教师课程表',fitColumns:true,singleSelect:true"  
       >   
    <thead>
     	    <tr>
            	<th field="attr1" align="center" colspan=11>教员课程表</th>
            </tr>
            <tr>
            	<th field="a" width="60px" rowspan="2" align="center">教员</th>
                <th field="b" width="40px" rowspan="2" align="center">日期</th>
                <th field="c" colspan="3" align="center">上午</th>
                <th field="d" colspan="3" align="center">下午</th>
                <th field="e"  colspan="3" align="center">晚上</th>
            </tr>
               <tr>
                <th field="f" align="center">班级</th>
                <th field="g" align="center">课程</th>
                <th field="h" align="center">机房</th>
                <th field="i" align="center">班级</th>
                <th field="j" align="center">课程</th>
                <th field="k" align="center">机房</th>
                <th field="l" align="center">班级</th>
                <th field="m" align="center">课程</th>
                <th field="n" align="center">机房</th>
            </tr>
            <c:forEach items="${teacher}" var="t">
            <c:forEach items="${t.info}" var="f"  varStatus="state">
                 <tr>  
                 <c:if test="${state.index==0}">
                  <th field="attr6" align="center" rowspan="${t.count }">${t.cMorning1Teacher}</th>
                  </c:if>
                  <th field="status"align="center">${f.date1}</th>
                  <th field="f" align="center">${f.cMorning1Class }</th>
                  <th field="g" align="center">${f.cMorning1Course}</th>
                  <th field="h" align="center">${f.cClassromm1}</th>
                  <th field="i" align="center">${f.cAfternoon1Class }</th>
                  <th field="j" align="center">${f.cAfternoon1Course}</th>
                  <th field="k" align="center">${f.cClassromm2}</th>
                  <th field="l" align="center">${f.cEveningClass }</th>
                  <th field="m" align="center">${f.cEveningCourse}</th>
                  <th field="n" align="center">${f.cClassromm3}</th>
                </tr>
                </c:forEach>
         </c:forEach>
        </thead>
</table>  
<a id="btn" href="printTeachertable.s" class="easyui-linkbutton" data-options="iconCls:'icon-excel'">导出</a>
</body>
</html>