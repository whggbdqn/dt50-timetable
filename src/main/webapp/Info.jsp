<%@ page language="java" pageEncoding="UTF-8"%>
<!-- js编写区  -->
<style type="text/css">
.change{
  cursor:pointer;
}

</style>
<link rel="stylesheet" href="layui/css/layui.css"  media="all">
<script type="text/javascript">
function post1(){
	$.post("getAllInfo.s",null,function(data){
		for(var i=0;i<data.length;i++)
			{
			 var choice="choice"+i;
		     var co="<a id='"+choice+"' class='change'>	  <span class='layui-badge-dot layui-bg-blue'></span>&nbsp;&nbsp;"+data[i].ifTitle+"</a>";
		     var bo="<input type='hidden' value='&nbsp;&nbsp;&nbsp;"+data[i].ifContent+"'><br><br>";
		      $(co).appendTo("#mytitle");
		      $(bo).appendTo("#mytitle");
		      var res="#"+choice;
		      $(res).click(function (){
		    		$(this).parent().html($(this).next().val());
		    		$("#btn").attr("style","visiable:true");
		    	});
		  }
	});	
	
	
}


<!--公告js开始-->
$(function (){
	post1();
$("#btn").click(function (){
	$("#btn").attr("style","display:none");
    $("#mytitle").html("");
	 //window.parent.location.href="index.jsp"; 
	$.post("getAllInfo.s",null,function(data){
		for(var i=0;i<data.length;i++)
			{
			 var choice="choice"+i;
		     var co="<a id='"+choice+"' class='change'> <span class='layui-badge-dot layui-bg-blue'></span>&nbsp;&nbsp;"+data[i].ifTitle+"</a>";
		     var bo="<input type='hidden' value='&nbsp;&nbsp;&nbsp;"+data[i].ifContent+"'><br><br>";
		      $(co).appendTo("#mytitle");
		      $(bo).appendTo("#mytitle");
		      var res="#"+choice;
		      $(res).click(function (){
		    		$(this).parent().html($(this).next().val());
		    		$("#btn").attr("style","visiable:true");
		    	});
		  }
	});	
   });
});

<!--公告js结束 -->
</script>
<!-- 公告 开始-->
<a id="btn" style="display:none" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true"></a>  

     <div  style="color: red;text-indent: 70px;font-size: 25px;" ><strong>公告</strong></div>
     <div align=center></div>
<table cellspacing=0 cellpadding=1 width="100%" bgcolor=#ecf1fb border=0>
<table border=0>
<tr><th ><marquee direction=up height=300 width=180 id=m onmouseout='m.start()' onMouseOver='m.stop()' scrollamount=2 align="center">
<font size=2 style="color: blue">
<a id="mytitle"></a>
</font></marquee></th>
</table>
</table>
 <!-- 公告 结束 -->
