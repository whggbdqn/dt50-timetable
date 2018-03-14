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
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>
</head>
<body>
	<div title="class" style="padding: 20px;">
	<table id="dg"> 
		<form style="text-align: center;">
        班级名称:<input class="myinput" name="classname" type="text" required="required"/>
        <br/> <br/>
        班级人数:<input class="myinput" value="30" name="totalnum" type="number" required="true" min="1"/>
        <br/> <br/>
        开班时间:<input class="myinput" name="beginyear" type="date" required="true"/>
        <br/> <br/>
        班级类型:
        <select class="myinput" name="classtype" required="true">
        	<option value="1">java</option>
        	<option value="2">ui</option>
        </select>
        <br/> <br/>
        <input  type="button" name="button" value="添加">
    </form>
    </table>
	</div>
</body>
</html>
<script>
	$(function(){
		$("input[name='button']").click(function(){
			var fog = true;
			for(var i=0;i<$(".myinput").length;i++){
				if($(".myinput").val()==""){
					fog=false;
					break;
				}
			}
			if(fog == true){
				var $form = $("form").serialize();
				$form = decodeURIComponent($form,true);
				$.ajax({
					type:"post",
					url:"addOneClass.s",
					data:$form,
					success:function(data){
						if(data>0){
							//关闭弹层
							var index = parent.layer.getFrameIndex(window.name); //获取窗口索引  
				            parent.layer.close(index);
				            $('#dg').datagrid("reload");
				           // parent.location.reload(); // 父页面刷新  
						  }
					}
				});
			
			}else{
				
			}
		});
	});
</script>