<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">

<!--导入EasyUI-->
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
	
 <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css"> 
 <!--layui包<link rel="stylesheet" href="layui/css/layui.css"  media="all">-->
 <link rel="stylesheet" href="layui/css/layui.css"  media="all">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>

<script type="text/javascript">

$(function(){
	/* 删除课程节点及课程  */
	$("#delCourse").click(function(){
		var find=$("input[name=cb]");//找到名称为cb的复选框 
		var str="";
		//循环判断找出被选中的复选框 
		for (var i = 0; i < find.length; i++) {
			if(find.eq(i).prop("checked")){
				str+=find.eq(i).val()+",";//被选中的值用逗号分隔开 
			}
 		}
		if(str==""){
			$.messager.alert('警告','请先选择要删除的行！');
			setTimeout(function(){
				  $(".messager-body").window('close');  
				},1500);
			
		}else{
		$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
		    if (r){    
				str=str.substring(0,str.length-1);//对字符串进行截取，从第一位到倒数第二位 
				$.post("delNc.s",{"str":str},function(data){//传名称为str的字符串到控制器 
					if(data>0){
						$.messager.alert('警告','删除成功');
						setTimeout(function(){
							  $(".messager-body").window('close');  
							},1000);
					}else{
						$.messager.alert('警告','删除失败');
					}
					location.href="getAllCcd.s";
				})    
		    }    
		}); 
		}
	});
	//删除课程节点
	$("#delClassnode").click(function(){
		var find=$("input[name=cb1]");//找到名称为cb的复选框 
		var str="";
		//循环判断找出被选中的复选框 
		for (var i = 0; i < find.length; i++) {
			if(find.eq(i).prop("checked")){
				str+=find.eq(i).val()+",";//被选中的值用逗号分隔开 
			}
		}
		if(str==""){
			$.messager.alert('警告','请先选择要删除的课程节点！');
			setTimeout(function(){
				  $(".messager-body").window('close');  
				},1500);
			
		}else{
			$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
			    if (r){    
				str=str.substring(0,str.length-1);//对字符串进行截取，从第一位到倒数第二位 
				$.post("delCn.s",{"str":str},function(){//传名称为str的字符串到控制器
				
				location.reload();
				//alert(index);
				
		        })
		       } 
			});
			
		}	  
	});
	/* 修改 课程类型 */
	$("#upCourse").click(function(){
		var count=0;
		var find=$("input[name=cb]");//找到名称为cb的复选框 
		var courseid,coursename,courseperiod;
		for (var i = 0; i < find.length; i++) {
			if(find.eq(i).prop("checked")){
				count=count+1;
				courseid=find.eq(i).val();
				coursename=find.eq(i).next().val();
				courseperiod=find.eq(i).next().next().val();
			}
		}
		if(count==0){
			$.messager.alert('警告','请先选择要修改的行！');
			setTimeout(function(){
				  $(".messager-body").window('close');  
				},1500);
		}else{
		upCourse(courseid,coursename,courseperiod);}
	});
	//链接，课程表链接详情 
	$("input[name='courseName']").parent().click(function(){
		//alert("ff");
		var index=$(this).children().val();
		//alert(index);
		
		$("#accordion1").accordion('select','详情');
		$("#accordion2").accordion('select',index);
		
		//$('#detail').accordion('getSelected');
		//selectPanel()
		
			
			
		});
	//链接，课程节点 链接详情 
	$("input[name='nodeName']").parent().click(function(){
		//alert("ff");
		var index=$(this).children().val();
		//alert(index);
		
		$("#accordion1").accordion('select','详情');
		$("#accordion2").accordion('select',index);
		
		//$('#detail').accordion('getSelected');
		//selectPanel()
		
			
			
		});
		/* $("td[name='my']").click(function (){
			$('#my 1').accordion('select',"详情");
			
			$("#aa").accordion('select',2);
			var index=this.val();
		});
		 */
	});



		
	



/* 添加课程类型信息  */
function addCourse(){     
	layer.open({
		  type: 2,
		  title:'添加课程信息',
		  area: 'auto',
		  content: 'CourseAdd.jsp' ,//这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
		  area: ['380px','300px'],//自定义文本域宽高
		  offset: ['100px', '150px'],//距离父类左侧100，上方150
		}); 
     }
/* 添加课程节点 信息  */
function addClassnode(){     
	layer.open({
		  type: 2,
		  area: 'auto',
		  title:'添加节点信息',
		  content: 'ClassnodeAdd.jsp' ,//这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
		  area: ['440px','300px'],//自定义文本域宽高
		  offset: ['100px', '150px'],//距离父类左侧100，上方150
		}); 
     }
/* 修改 课程类型信息  */
function upCourse(courseid,coursename,courseperiod){     
	layer.open({
		  type: 2,
		  title:'修改课程信息',
		  area: 'auto',
		  content: 'CourseUpdate.jsp' ,//这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
		  area: ['380px','300px'],//自定义文本域宽高
		  offset: ['100px', '150px'],//距离父类左侧100，上方150
		  success:function(layero,index){
			  var body=layer.getChildFrame('body',index);//找到弹出的页面，index表示坐标
			  body.find('[name=courseid]').val(courseid);
			  body.find('[name=coursename]').val(coursename);
			  body.find('[name=courseperiod]').val(courseperiod);
		  }
		}); 
     }


</script>
</head>
<body>

	<div style="margin:20px 0 10px 0;"></div>
	<div class="easyui-accordion"  style="width:600px;height: 500px;" id="accordion1">
		<div title="课程类型" style="padding:10px " data-options="iconCls:'icon-ok'">
		<div style="padding:5px;background:#fafafa;width:565px;border:1px solid #ccc">
	<a  class="easyui-linkbutton" iconCls="icon-add" onclick="addCourse()">添加课程</a>
	<a id="delCourse" class="easyui-linkbutton" iconCls="icon-remove">删除课程</a>
	<a id="upCourse" class="easyui-linkbutton" iconCls="icon-edit">修改课程</a>
</div>
 

			<table id="dg" class="easyui-datagrid" 
					data-options="url:'datagrid_data1.json',method:'get',fit:true,fitColumns:true,singleSelect:false">
				<thead>
					<tr>
						<th data-options="field:'aa',width:30"></th>
						<th data-options="field:'itemid',width:180">课程编号</th>
						<th data-options="field:'productid',width:180">课程名称</th>
						<th data-options="field:'listprice',width:180">课程周期/月</th>
					</tr>
				</thead>
				<!-- 加表格 -->
				<tbody >
				<c:forEach items="${list }" var="l">
				<tr><td><input type="checkbox" name="cb" value="${l.courseid}"><input type="hidden" value="${l.coursename }"><input type="hidden" value="${l.courseperiod}"></td>
				<td>${l.courseid }</td>
				<td >${l.coursename }<input type="hidden" name="courseName" value="${l.coursename}"></td>
				<td>${l.courseperiod }</td></tr>
				</c:forEach>
				<!--  使上面的表格内容撑起来-->
					<tr><td></td><td></td><td></td></tr>
				</tbody>
			
			</table>
			
		</div>
		<div title="课程节点" data-options="iconCls:'icon-help'" style="padding:10px" id="accordionm">
		<div title="action" style="padding:5px;background:#fafafa;width:565px;border:1px solid #ccc">
	<a class="easyui-linkbutton" iconCls="icon-add" onclick="addClassnode()">添加课程节点</a>
	<a id="delClassnode" class="easyui-linkbutton" iconCls="icon-remove">删除课程节点</a>

</div>
			<table id="dg" class="easyui-datagrid" 
					data-options="url:'datagrid_data1.json',method:'get',fit:true,fitColumns:true,singleSelect:true">
				<thead>
					<tr>
					<th data-options="field:'aa',width:30"></th>
						<th data-options="field:'itemid',width:180">体系编号</th>
						<th data-options="field:'productid',width:180">体系名称</th>
						<th data-options="field:'leixing',width:180">所属类型</th>
					</tr>
				</thead>
					<!-- 加表格 -->
				<tbody >
				<c:forEach items="${list }" var="l">
				<c:forEach items="${l.classnodes }" var="j">
				<tr><td><input type="checkbox" name="cb1" value="${j.nodeid}"></td>
				<td>${j.nodeid }</td>
				<td>${j.nodename }</td><input type="hidden" name="nodeName" value="${j.nodename }"></td>
				<td>
				<c:if test="${j.nodetype ==l.courseid}">
				${l.coursename}
				</c:if>
				</td>
				</tr>
				</c:forEach>
				</c:forEach>
				<tr><td></td><td></td><td></td></tr>
				</tbody>
				
			</table>
		</div>
		
		<!--手风琴套手风琴 -->
			<div title="详情" style="padding:10px" data-options="iconCls:'icon-tip'" >
			<div class="easyui-accordion" style="width:560px;height:400px;"  id="accordion2">
			<c:forEach items="${list }"  var="l">
			<div title="${l.coursename}"   style="padding:10px" data-options="iconCls:'icon-mini-add'">
			<!-- fitColumns:false把列固定死 -->
			<table id="dg" class="easyui-datagrid" 
			
					data-options="url:'datagrid_data1.json',method:'get',fit:true,fitColumns:false,singleSelect:true">
				<thead>
					<tr>
					<th data-options="field:'itemid',width:200">编号</th>
					<th data-options="field:'productid',width:280">具体课程</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${l.classnodes }" var="f">
					<tr><td>${f.nodeid }</td><td>${f.nodename }</td>
				</c:forEach>
				</tbody>
			</table>
				</div>
		</c:forEach>
		</div>
	
			</div>
	</div>
</body>
</html>