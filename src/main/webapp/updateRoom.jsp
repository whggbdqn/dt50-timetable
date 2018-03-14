<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<!--导入EasyUI-->
<link rel="stylesheet" type="text/css"
	href="easy/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easy/themes/icon.css">
<script type="text/javascript" src="easy/jquery.min.js"></script>
<script type="text/javascript" src="easy/jquery.easyui.min.js"></script>
<script type="text/javascript">
function updaterooom(){
	var tijiao=$('#update').serialize();
	$.post("updateClassRoom.s",tijiao,function(data){});
	window.parent.location.reload();
	var index=parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);
}


</script>

</head>

<body>

       <form id="update"> 
       <div class="fitem">   
           <label> 教室编号
           </label> 
           <input type="text" name="roomid" class="easyui-validatebox" required="true" /> 
       </div> 
       
       <div class="fitem"> <label> 教室名称
       </label> 
           <input type="text" name="roomname" class="easyui-validatebox" required="true" /> 
       </div> 
       
       <div class="fitem"> 
           <label> 教室人数
           </label> 
           <input type="text" name="roomsize" class="easyui-validatebox" required="true" /> 
       </div> 
       
       <div class="fitem"> 
           <label> 创建类型
           </label> 
           <input type="text" name="roomtype" class="easyui-validatebox" required="true" /> <br><br>
       
      <center><input type="button" onclick="updaterooom();" value="提交"></center>
      
       </form> 

</body>
</html>