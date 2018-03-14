<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="layer/mobile/need/layer.css">
<script type="text/javascript" src="jquery-1.8.3.min.js"></script>
<link rel="stylesheet" href="layui/css/layui.css">
<script type="text/javascript" src="layer/layer.js"></script>
<script src="layui/layui.js"></script>
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="layer/mobile/need/layer.css">
<style type="text/css">
#butt{
	position: relative;
	top: 70px;
	left: 100px;
}
#but1{
	position: relative;
	top: 70px;
	left: 105px;
}
#div1{
    float: left;
	position: relative;
	top: -30px;
	left: 205px;
}
#div2{
	float: left;
	position: relative;
	top: -60px;
	left: 205px;
}
</style>

</style>
<script type="text/javascript" src="jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>
<script type="text/javascript" src="layui/layui.js"></script>
</head>
<body>
	<div title="class" style="padding: 20px;">
		<form style="text-align: center;">
		<div class="layui-form-item" style="text-align: center;">
	    <label class="layui-form-label">意见编号</label>
	    <div class="layui-input-block">
	      <input type="text" name="suggestionid" readonly="readonly" value="${tbSuggestion.suggestionid }" lay-verify="title" autocomplete="off" class="layui-input" style="width: 200px;" readonly="readonly">
	    </div>
    </div>
    
    <div class="layui-form-item" style="text-align: center;">
	    <label class="layui-form-label">意见标题</label>
	    <div class="layui-input-block">
	      <input type="text" id="teachername" onblur="checkteachername()" name="suggestiontitle" value="${tbSuggestion.suggestiontitle }" lay-verify="title" autocomplete="off" class="layui-input" style="width: 200px;">
	      <div id="div1" style="height: 0px"></div>
	    </div>
    </div>
    
    <div class="layui-form-item layui-form-text" style="text-align: center;">
	    <label class="layui-form-label">意见内容</label>
	    <div class="layui-input-block">
	      <textarea id="teacherjobnumber" onblur="checkteacherjobnumber()" value="${tbSuggestion.suggestioncontent }" class="layui-textarea" name="suggestioncontent" style="width: 200px;"></textarea>
	      <div id="div2" style="height: 0px"></div>
	    </div>
	  	</div>
    
    <div class="layui-form-item" style="text-align: center;">
	    <label class="layui-form-label">教师编号</label>
	    <div class="layui-input-block">
	      <input type="text" name="teacherid" readonly="readonly" value="${tbSuggestion.teacherid }" lay-verify="title" autocomplete="off" class="layui-input" style="width: 200px"  readonly="readonly">
	    </div>
    </div>
       <input id="butt" type="button" name="button" value="修改" style="background-color: #1E9FFF; width: 60px; height: 30px; color: white; font-size: 16px; border-radius: 4px; border: none;">
        <input id="but1" type="button" name="button1" onClick="window.close();" value="取消" style="background-color: #1E9FFF; width: 60px; height: 30px; color: white; font-size: 16px; border-radius: 4px; border: none;">
    </form>
	</div>
</body>
</html>
<script>
function checkteachername(){
	var teachername=$("#teachername").val();
	var reg = /^\s*$/g;
	if(teachername!=""){
		var oSpan = document.getElementById('div1');
		var oImg = document.createElement('img');   //创建一个img标签
		oImg.src = 'img/ok.png';    //给img标签添加src属性
		oSpan.style.backgroundRepeat = 'no-repeat'
		oSpan.appendChild(oImg);    //将img标签添加到span标签里面。
		//$("#teachernameNotice").innerHTML="<img src='img/ok.png'>"
		return true;
	}
	else{
		layer.alert('标题不能为空', {
			icon: 5,
			title: "提示"
			});
		return false;
	}
}
/*验证内容*/
function checkteacherjobnumber(){
	var teacherjobnumber=$("#teacherjobnumber").val();
	var reg=/^[\u4e00-\u9fa5]{2,4}$/;      //定义正则表达式
	if(teacherjobnumber!=""){
		var oSpan = document.getElementById('div2');
		var oImg = document.createElement('img');   //创建一个img标签
		oImg.src = 'img/ok.png';    //给img标签添加src属性
		oSpan.appendChild(oImg);
		//$("#teachernameNotice").innerHTML="<img src='img/ok.png'>"
		return true;
	}
	else{
		layer.alert('内容不能为空', {
			icon: 5,
			title: "提示"
			});
		return false;
	}
}

/*验证所有*/
function checkAll(){
	if(checkteacherjobnumber()&&checkteachername()){
		document.addForm.submit();  //提交
	}else{
		
	}
}
	$(function(){
		$("input[name='button']").click(function(){
			var fog = true;
			//alert($(".myinput").length);
			for(var i=0;i<$(".layui-input").length;i++){
				if($(".layui-input").val()==""){
					fog=false;
					break;
				}
				if($(".layui-textarea").val()==""){
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
					url:"updateOneSuggestion.s",
					data:$form,
					success:function(data){
						if(data>0){
							parent.$("#close").val("1");
							//关闭弹层
							var index = parent.layer.getFrameIndex(window.name); //获取窗口索引  
				            parent.layer.close(index);
				          //parent.location.reload();
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