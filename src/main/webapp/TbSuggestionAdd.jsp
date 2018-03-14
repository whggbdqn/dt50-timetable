<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="layer/mobile/need/layer.css">
<link rel="stylesheet" type="text/css" href="layer/theme/default/layer.css">
<style type="text/css">
#butt{
	position: relative;
	top: 20px;
	left: 60px;
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
<script type="text/javascript" src="jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>
</head>
<body>
	<div title="class" style="padding: 20px;">
	<form style="text-align: center;" method="post">
	<div class="layui-form-item" style="text-align: center;">
	    <label class="layui-form-label">意见标题</label>
	    <div class="layui-input-block">
	      <input id="teachername" onblur="checkteachername()" type="text" name="suggestiontitle" autocomplete="off" placeholder="请输入标题" class="layui-input" style="width: 200px;">
	      <div id="div1" style="height: 0px"></div>
	      <!-- <span id="span1"></span> -->
	    </div>
    </div>
    <br>
    <div class="layui-form-item layui-form-text" style="text-align: center;">
	    <label class="layui-form-label">意见内容</label>
	    <div class="layui-input-block">
	      <textarea id="teacherjobnumber" onblur="checkteacherjobnumber()" placeholder="请输入内容" class="layui-textarea" name="suggestioncontent" style="width: 200px;" ></textarea>
	      <div id="div2" style="height: 0px"></div>
	     <!--  <span id="span2"></span> -->	
	    </div>
	  	</div>
	  	<div class="layui-form-item">
    <div class="layui-input-block">
      <input onclick="checkAll()" id="butt" type="button" name="button" value="添加" style="background-color: #1E9FFF; width: 60px; height: 30px; color: white; font-size: 16px; border-radius: 4px; border: none;">
    </div>
  </div>
    </form>
	</div>
</body>
</html>
<script>
/*验证标题*/
function checkteachername(){
	var teachername=$("#teachername").val();
	if(teachername!=""){
		var oSpan = document.getElementById('div1');
		var oImg = document.createElement('img');   //创建一个img标签
		oImg.src = 'img/ok.png';    //给img标签添加src属性
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
/* function checkAll(){
	if(checkteacherjobnumber()&&checkteachername()){
		document.addForm.submit(); 
	}else{
		
	}
}
 */
	$(function(){
		$("input[name='button']").click(function(){
			var fog = true;
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
				$.ajax({
					type:"post",
					url:"addOneSuggestion.s",
					data:$form,
					success:function(data){
						if(data>0){
							//关闭弹层
						parent.$("#close").val("1");
							var index = parent.layer.getFrameIndex(window.name); //获取窗口索引  
				            parent.layer.close(index); 
				           $('#dg').datagrid("reload");
				         	//parent.location.reload(); // 父页面刷新  
						  } else{
							  parent.$("#close").val("0");
						  } 
					}
				});
			
			}else{
				
			}
		});
	});
</script>