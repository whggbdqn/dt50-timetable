<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!--导入EasyUI-->  
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" href="layui/css/layui.css"  media="all">
<link rel="stylesheet" type="text/css" href="layer/theme/default/layer.css">
<link rel="stylesheet" type="text/css" href="layer/mobile/need/layer.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<link rel="stylesheet" href="layui/css/layui.css"  media="all">
<link rel="stylesheet" type="text/css" href="layer/theme/default/layer.css">
<link rel="stylesheet" type="text/css" href="layer/mobile/need/layer.css">

<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<style type="text/css">
#butt{
	position: relative;
	top: 20px;
	left: 80px;
}
</style>
<script type="text/javascript">
$(function(){
	
	$('#cc').combobox({   
	    url:'getAllCcdByAjax.s',   
	    valueField:'courseid',   
	    textField:'coursename'  
	}); 
	
});

/*异步添加 */
function addClassnode(){
	if(checknodename()&&checknodetype()){
	var a=$("#yf").serialize();
	$.post("addClassnode.s",a,function(data){
		parent.layer.alert("添加成功 ");	
		window.parent.location.href="getAllCcd.s";
		var index=parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);
	});
	}
/* 	window.parent.location.reload();//使父页面刷 新
	var index=parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);
	 */
}


/*验证节点名称*/
function checknodename(){
	var nodename=$("#nodename").val();
	var regnodename=/^\w{1,}$/;
	if(nodename!=""){
	if(regnodename.test(nodename)){
		//$("#tnodename").text("√").css("color","green");
		return true;
	}
	else{
		layer.alert('节点名 错误', {
			icon: 5,
			title: "提示"
			});
		//$("#tnodename").text("×").css("color","red");
		return false;
	}}else{
		layer.alert('节点名 不能为空', {
			icon: 5,
			title: "提示"
			});
		return false;
	}
}
/*验证类型*/
function checknodetype(){
	var nodetype=$("#cc").val();
	var regnodetype=/^\w{1,}$/;
	if(nodetype!=""){
	if(regnodetype.test(nodetype)){
		//$("#tnodetype").text("√").css("color","green");
		return true;
	}
	else{
		layer.alert('节点类型错误', {
			icon: 5,
			title: "提示"
			});
		//$("#tnodetype").text("×").css("color","red");
		return false;
	}}else{
		layer.alert('节点类型不能为空', {
			icon: 5,
			title: "提示"
			});
		return false;
	}
}

</script>
</head>
<body>
<div style="padding: 20px;">
<form method="post" id="yf">
<label class="layui-form-label"  style="font-size: 15px;" >节点名</label>
    <div class="layui-input-block">
      <input type="text" id="nodename" name="nodename"   placeholder="请输入课程节点" class="layui-input" style="width: 150px" >
    </div>
   <br/>
  <label class="layui-form-label"  style="font-size: 15px;" > 所属类型</label><input id="cc"  name="nodetype" style="height: 30px;width: 150px;" data-options='editable:false'>  
 
		<!-- 按钮 -->
	<div class="layui-form-item">
    <div class="layui-input-block">
      <input onclick="addClassnode()" id="butt" type="button" name="button" value="添加" style="background-color: #1E9FFF; width: 60px; height: 30px; color: white; font-size: 16px; border-radius: 4px; border: none;">
    </div>
  </div>
		<!-- <p>请输入需要添加的课程节点名称:</p>
		<p>&nbsp;节点名: <input type="text" id="nodename" name="nodename" onblur="checknodename()"><label id="tnodename"></label></p>
		<p>所属类型: <input id="cc" id="nodetype" name="nodetype"  onblur="checknodetype()"><label id="tnodetype"></label>  
</p>
		<p><div style="padding:5px;text-align:center;">
			<input type="button" value="添加" onclick="addClassnode()">
		</div></p> -->
</form>
</div>
</body>

</html>