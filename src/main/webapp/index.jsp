<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
  


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>北大青鸟</title>
<!--导入EasyUI-->
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<!-- js编写区  -->
<script type="text/javascript">
//加载事件
$(function(){
	// 关闭选项卡，使用异步确认对话框
	$('#mainTabs').tabs({
	  onBeforeClose: function(title,index){
		var target = this;
		$.messager.confirm('确认','你确认想要关闭'+title,function(r){
			if (r){
				var opts = $(target).tabs('options');
				var bc = opts.onBeforeClose;
				opts.onBeforeClose = function(){
			   $("#body").layout('expand','west'); 
			   $("#body").layout('expand','north');  	
					
				};  // 允许现在关闭
				$(target).tabs('close',index);
				opts.onBeforeClose = bc;  // 还原事件函数
			}
		});
		return false;	// 阻止关闭
	  }
	});

	
	
	
});



//通用选项卡
function addNewTab(tabname, url) {  
    //创建一个新的窗口，在mainlayout上    
    if(!$("#mainTabs").tabs('getTab', tabname)) {  
        $("#mainTabs").tabs('add', {  
            title: tabname,  
            selected: true,  
            closable: true,  
            content: "<iframe src='" + 'http://' + url + "' style='width:100%;height:100%'  frameborder='no' border='0' marginwidth='0' marginheight='0' scrolling='yes' />"  
        });  
    } else {  
        $('#mainTabs').tabs('select', tabname);  
    }  
}  


//排课小助手的选项卡
function OpenPaiKe(tabname, url){
	 //创建一个新的窗口，在mainlayout上    
    if(!$("#mainTabs").tabs('getTab', tabname)) {  
        $("#mainTabs").tabs('add', {  
            title: tabname,  
            selected: true,  
            closable: true,  
            content: "<iframe src='" + 'http://' + url + "' style='width:100%;height:100%'  frameborder='no' border='0' marginwidth='0' marginheight='0' scrolling='yes' />"  
        });  
        $("#body").layout('collapse','west');  
        $("#body").layout('collapse','north');  
       /*  $("#body").layout('collapse','south');   */
        $("#body").layout('collapse','east');  
    } else {  
        $('#mainTabs').tabs('select', tabname);  
    }  
	
	
}


</script>

</head>
<body class="easyui-layout" id="body">
        <!--顶部-->
   <div data-options="region:'north',iconCls:'icon-bird1',title:'北大青鸟官方排课助手',split:true"style="height: 100px; position:relative;">
		<center><h1>北大青鸟智能排课系统</h1></center> <label id="btn"  style="position:absolute;right:110px;top:15px"; class="easyui-linkbutton" data-options="iconCls:'icon-man',plain:true"></label><div style="position:absolute;right:20px;top:20px";>欢迎你,<shiro:user><shiro:principal></shiro:principal></shiro:user><a href="logout.s" style="color:blue">  注销</a></div>
	</div>
   
    <!--页脚--> 
    <!-- <div data-options="region:'south',title:'South Title',split:true" style="height:100px;"></div>  -->  
     <!--右边留言区域--> 
    <div data-options="region:'east',iconCls:'icon-mes',title:'公告栏',split:true" style="width:220px;"><%@ include file="Info.jsp" %></div>   
    <!--左侧菜单start-->
    <div data-options="region:'west',title:'导航菜单',split:true" style="width:130px;">
	<div class="easyui-panel" data-options="fit:true">  
    <!--手风琴菜单--> 
			<div class="easyui-accordion" data-options="multiple:true,fit:true"> 
				<c:forEach items="${parentMenulist}" var="p">
	           		<c:if test="${p.menuparentid==0}">
	                	<div title="${p.menuname}" data-options="iconCls:'icon-model'" style="overflow:auto;padding:10px;">
		                	<c:forEach items="${parentMenulist}" var="c">
		                		<c:if test="${p.menuid==c.menuparentid}">
		                			<p class="easyui-linkbutton" data-options="iconCls:'icon-coursetable',plain:true" onclick="OpenPaiKe('${c.menuname}','${c.menuurl}')">${c.menuname}</p>
		                		</c:if>
		                	</c:forEach>
		                </div>
	              	</c:if>
	     		</c:forEach>
			</div>
	</div>
	</div>
	 <!--中间主要区域-->
    <div data-options="region:'center'" style="padding:5px;background: url(img/index.jpg) no-repeat center;">
     <!--左侧菜单链接的选项卡  -->
     <div id="mainTabs" class="easyui-tabs" data-options="fit:true">  
              
                </div>
                
    </div>   
  
</body>
</html>