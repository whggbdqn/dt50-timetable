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
/*验证标题*/
function checkcoursename(){
	var coursename=$("#coursename").val();
	//alert(coursename);
	var regname=/^\w{1,}$/;
	if(coursename!=""){
	if(regname.test(coursename)){
		//$("#tname").text("√").css("color","green");
		return true;
	}
	else{
		layer.alert('课程名错误', {
			icon: 5,
			title: "提示"
			});
		//$("#tname").text("×").css("color","red");
		
		return false;
	}
	}else{
		layer.alert('课程名不能为空', {
			icon: 5,
			title: "提示"
			});
		return false;
	}
	
}
/*验证周期*/
function checkperiod(){
	var courseperiod=$("#courseperiod").val();
	var regperiod=/^\d{1,}$/;
	if(courseperiod!=""){
	if(regperiod.test(courseperiod)){
		//$("#tperiod").text("√").css("color","green");
		return true;
	}
	else{
		layer.alert('周期必须为数字', {
			icon: 5,
			title: "提示"
			});
		//$("#tperiod").text("×").css("color","red");
		return false;
	}
	}else{
		layer.alert('周期不能为空', {
			icon: 5,
			title: "提示"
			});
		return false;
	}
}  

/*异步添加 */
function upCourse(){
	var a=$("#yf").serialize();
	if(checkcoursename()&&checkperiod()){
	$.post("upCourse.s",a,function(data){
		parent.layer.alert("修改成功 ");	
		window.parent.location.href="getAllCcd.s";//使父页面刷 新
		var index=parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);
		
	});
	}
	
}
</script>
</head>
<body>
<div style="padding: 20px;">
<form method="post" id="yf">
 <label class="layui-form-label"  style="font-size: 15px;">编号</label>
    <div class="layui-input-block">
      <input type="text" id="courseid" name="courseid" readonly   class="layui-input" style="width: 150px">
    </div>
    <br/>
     <label class="layui-form-label"    style="font-size: 15px;">课程名</label>
    <div class="layui-input-block">
      <input type="text" id="coursename" name="coursename"  placeholder="请输入课程名" class="layui-input" style="width: 150px" onblur="checkcoursename()">
    </div>
    <br/>
     <label class="layui-form-label"   style="font-size: 15px;">周期</label>
    <div class="layui-input-block">
      <input type="text" id="courseperiod" name="courseperiod"  placeholder="请输入周期" class="layui-input" style="width: 150px" onblur="checkperiod()">
    </div>
    
    <!-- 按钮 -->
	<div class="layui-form-item">
    <div class="layui-input-block">
      <input onclick="upCourse()" id="butt" type="button" name="button" value="修改" style="background-color: #1E9FFF; width: 60px; height: 30px; color: white; font-size: 16px; border-radius: 4px; border: none;">
    </div>
  </div>
		<!-- <p>请输入需要修改的课程:</p>
		
		<p style="text-indent:16px">编号:<input type="text" name="courseid" readonly></p>
		<p>课程名: <input type="text" name="coursename"></p>
		<p style="text-indent:16px">周期: <input type="text" name="courseperiod"></p>
		<p><div style="padding:5px;text-align:center;">
			<input type="button" value="修改" onclick="upCourse()">
		</div></p> -->
</form>
</div>
</body>
</html>