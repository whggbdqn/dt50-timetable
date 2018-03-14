<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>

<body>
<body>

	 <div style="margin: 20px 0;"></div>
	<table class="easyui-datagrid" title="排课明系"
		data-options="rownumbers:true,singleSelect:true,url:'datagrid_data1.json',method:'get',toolbar:toolbar">
	</table>
	<script type="text/javascript">
		var toolbar = [ {
			text : '显示数据',
			iconCls : 'icon-add',
			handler : function() {
				$('.easyui-datagrid').datagrid({
					   pagination:true,//分页控件  
			            pageSize: 10,//每页显示的记录条数，默认为10  
		     			pageList: [10,20],//可以设置每页记录条数的列表  
		      		beforePageText: '第',//页数文本框前显示的汉字  
		      		afterPageText: '页    共 {pages} 页',  
		     			displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录', 
		
					url : 'showban.s',
					columns : [ [ {
						field : 'tbClass',
						//求它的子属性
						 formatter : function(value,row,index){
				                if (row.tbClass){
				                    return row.tbClass.classname;
				                } else {
				                    return value;
				                }},
						title : '班级',
						width : 300
					}, {
						field : 'tbTeacher',
						 formatter : function(value,row,index){
				                if (row.tbTeacher){
				                    return row.tbTeacher.teachername;
				                } else {
				                    return value;
				                }},
						title : '教师',
						width : 300
					}
				

	         				] ]
				});
				$('.easyui-datagrid').datagrid('load', {
					name : 'easyui',
					address : 'ho'
				});
				$('.easyui-datagrid').datagrid('reload');
			}
		}, {
			text : '导出Excel',
			iconCls : 'icon-cut',
			handler : function() {
				  location.href='downsecond.s'
			}
		}, '-', {
			text : '新增班主任教师',
			iconCls : 'icon-save',
			handler : function() {
				  location.href='tankuang.jsp'
			},
			
		},'-',{
			
			text : '新增教员教师',
			iconCls : 'icon-save',
			handler : function() {
				  location.href='tankuang2.jsp'
		}
		},'-',
{
			
			text : '教师详细查询',
			iconCls : 'icon-save',
			handler : function() {
				  location.href='Zsuper.jsp'
		}
}];
		
	</script>
	
</body>
</html>