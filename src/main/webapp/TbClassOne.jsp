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
		<form style="text-align: center;">
	 班级编号:<input class="myinput" name="classid" value="${tbClass.classid }" type="text" required="required"/>
        <br/> <br/>
        班级名称:<input class="myinput" name="classname" value="${tbClass.classname }" type="text" required="required"/>
        <br/> <br/>
        班级人数:<input class="myinput" name="totalnum" value="${tbClass.totalnum }" type="number" required="true" />
        <br/> <br/>
        开班时间:<input class="myinput" name="beginyear" value="${tbClass.beginyear }" type="date" required="true"/>
        <br/> <br/>
        班级类型:<input class="myinput" name="classtype" value="${tbClass.classtype }" type="text" required="true"/>
        <br/> <br/>
        <input  type="button" name="button" value="修改">
    </form>
	</div>
</body>
</html>
<script>
	$(function(){
		$("input[name='button']").click(function(){
			var fog = true;
			//alert($(".myinput").length);
			for(var i=0;i<$(".myinput").length;i++){
				if($(".myinput").val()==""){
					fog=false;
					break;
				}
			}
			if(fog == true){
				var $form = $("form").serialize();
				$form = decodeURIComponent($form,true);
				//alert($form);
				$.ajax({
					type:"post",
					url:"updateOneClass.s",
					data:$form,
					success:function(data){
						if(data>0){
							//关闭弹层
							var index = parent.layer.getFrameIndex(window.name); //获取窗口索引  
				            parent.layer.close(index);
				           
						  }else{
							  alert("失败");
							  var index = parent.layer.getFrameIndex(window.name); //获取窗口索引  
					          parent.layer.close(index);
							  
						  }
					}
				});
			
			}else{
				alert();
			}
		});
	});
</script>