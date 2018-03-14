<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!-- <link rel="stylesheet" type="text/css"
	href="easy/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="easy/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="easy/demo/demo.css">
<script src="js/jquery-1.8.3.min.js"></script> -->
<!--jquery.easyui.min.js包含了easyUI中的所有插件-->
<!-- <script src="js/jquery.easyui.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="layui/css/layui.css">
<script type="text/javascript" src="layer/layer.js"></script>
<script src="layui/layui.js"></script> -->
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript">
  //添加教室
var url;
var type;
function newuser() {
    $("#dlg").dialog("open").dialog('setTitle', '添加教室'); ;
    $("#fm").form("clear");
    url = "UserManage.aspx";
    document.getElementById("hidtype").value="submit";
      }
function edituser() {
    var row = $("#dg").datagrid("getSelected");
    if (row) {
        $("#dlg").dialog("open").dialog('setTitle', 'Edit User');
        $("#fm").form("load", row);
        url = "UserManage.aspx?id=" + row.ID;
        }
      }
  

  //复选框事件
function update(){
	var check=$("input[name='select'");
	var id;
	var name;
	var size;
	var type;
	for(var i=0;i<check.length;i++){
		if(check.eq(i).prop("checked")){
			id=check.eq(i).val();
			name=check.eq(i).next().val();
			size=check.eq(i).next().next().val();
			type=check.eq(i).next().next().next().val();
		}
	}
	
	showiframe(id,name,size,type);	
      }
  
     
     //删除提示
 	function delClassroom(roomid){
 		$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
 		    if (r){    
 		    	location.href='deleTbClassroom.s?roomid='+roomid; 
 		    	$.messager.show({
 		    		title:'我的消息',
 		    		msg:'删除成功',
 		    		showSpeed:500,
 		    		timeout:500,
 		    		showType:'fade',
 		    		style:{
 		    			
 		    		}
 		    	});

 		    }    
 		});  
    	 
    	 
 			
 	}
    
   
     //修改弹窗
     function saveUser(){
    	 $.post("updateClassRoom.s",$("#fm2").serialize(),function(data){
    		 if(!(data==null)){
    			 $.messager.show({
  		    		title:'我的消息',
  		    		msg:'修改成功',
  		    		showSpeed:1000,
  		    		timeout:1000,
  		    		showType:'fade',
  		    		style:{
  		    			
  		    		}
  		    	});
    			 //刷新表格
    			// $('#dg').datagrid('refresh');
    			// document.getElementById("xg").style.display="hidden";//隐藏
    		 }
    	 });
     }
     /*
function showiframe(id,name,size,type){
	layer.open({
		type:2,area:'auto',
		content:"updateRoom.jsp",
		offset:['150px','450px'],
	    success:function (layero,index){
		var body=layer.getChildFrame('body',index);
		body.find('[name=roomid]').val(id);
		body.find('[name=roomname]').val(name);
		body.find('[name=roomsize]').val(size);
		body.find('[name=roomtype]').val(type);
	    }	
	});	
	
	
}*/
//修改弹框页面取值
var url;
function newUser2(){
	var info=$("#dg").datagrid("getSelected");
    $('#xg').dialog('open').dialog('setTitle','更改信息');
    //给隐藏表单传值
    $("input[name='roomid']").val(info.AccountCode);
    $("input[name='roomname']").val(info.AccountName);
    $("input[name='roomsize']").val(info.AccountPwd);
    $("input[name='roomtype']").val(info.CreateTime);
    
     }
</script>
<!-- 弹框样式 -->
<style type="text/css"> 
        #fm 
        { 
            margin: 0; 
            padding: 10px 30px; 
        } 
        .ftitle 
        { 
        
            font-size: 14px; 
            font-weight: bold; 
            padding: 5px 0; 
            margin-bottom: 10px; 
            border-bottom: 1px solid #ccc; 
        } 
        .fitem 
        { 
            margin-bottom: 5px; 
        } 
        .fitem label 
        { 
            display: inline-block; 
            width: 80px; 
        } 
    </style> 
</head>
<body>

<input id="info1" value="" type="hidden"/>
<input id="info2" value="" type="hidden"/>
<input id="info3" value="" type="hidden"/>
<input id="info4" value="" type="hidden"/>

<!-- 显示页面 -->

 <table id="dg" title="教室信息管理" class="easyui-datagrid" 
           style="width:1200px;height:350px"
              toolbar="#toolbar" pagination="true"
               fitcolumns="true">
              
        <thead>
            <tr>
            <th field="Account" width="10" align="center">操作</th>
                <th field="AccountCode" width="50" align="center">
                    教室编号
                </th>
                <th field="AccountName" width="50" align="center">
                    教室名称
                </th>
                <th field="AccountPwd" width="50" align="center">
                    教室人数
                </th>
                <th field="CreateTime" width="50" align="center">
                    教室类型
                </th>
                <th field="CreateName" width="50" align="center">
                    操作
                </th>
            </tr>
          </thead>
          
          <tbody>
            <c:forEach items="${list }" var="s">
        <tr>
            <td><input type="checkbox"  name="select" value="${s.roomid }">
            <input type="hidden" value="${s.roomname }">
            <input type="hidden" value="${s.roomsize}">
            <input type="hidden" value="${s.roomtype}"></td>
            <td>${s.roomid }</td>
            <td>${s.roomname }</td>
            <td>${s.roomsize }</td>
            <td>
            <c:if test="${s.roomtype==0 }">机房</c:if>
            <c:if test="${s.roomtype==1 }">教室</c:if>
            <c:if test="${s.roomtype==2 }">多媒体</c:if>
            </td>
         <td>
       <a href="#" onclick="delClassroom(${s.roomid });" class="easyui-linkbutton" iconCls="icon-cancel">
            移除</a>
        </td>
        </tr>
            </c:forEach>
       </tbody>
    </table>
   
    <!-- 弹框功能按钮 -->
    <div id="toolbar">
    
     <a href="shwoTbClassroom.s" class="easyui-linkbutton" 
                      iconCls="icon-tip">更新</a>
                      
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-add" onclick="newuser()"
            >添加</a> 
            
            <!--  <a href="#" class="easyui-linkbutton" iconCls="icon-edit" 
                 onclick="update()">修改</a>-->
                
                    
                    <!-- -------plain="true"-------- -->
                    <a href="#" class="easyui-linkbutton" 
                    iconCls="icon-edit" onclick="newUser2()">修改</a>
                    
                   
</div> 

</div> 

    </div>
    
    <!-- 添加教室弹框 -->
    <div id="dlg" class="easyui-dialog" style="width:400px; height:280px; padding: 10px 20px;"
       closed="true" buttons="#dlg-buttons"> 
       <div class="ftitle"> 
           教室编辑 
       </div> 
       <form id="fm" method="post" action="insertTbClassroom.s" name="userForm"> 
       <div class="fitem"> 
           <label> 
               教室编号 
           </label> 
           <input name="roomid" class="easyui-validatebox" required="true" /> 
       </div> 
       <div class="fitem"> 
           <label> 
               教室名称</label> 
           <input name="roomname" class="easyui-validatebox" required="true" /> 
       </div> 
       <div class="fitem"> 
           <label> 
               教室人数</label> 
           <input name="roomsize" class="easyui-validatebox" required="true" /> 
       </div> 
       <div class="fitem"> 
           <label> 
               创建类型</label> 
           <input name="roomtype" class="easyui-validatebox" required="true" type="radio" value="0">机房
           		<input name="roomtype" class="easyui-validatebox" required="true" type="radio" value="1">教室
           		<input name="roomtype" class="easyui-validatebox" required="true" type="radio" value="2">多媒体<br><br>
       
      <center><input type="submit" value="添加"></center>
       
       </form> 
  
  
 
<!-- -修改弹框-- -->
<input type="hidden" value="" id="test"/>

<div id="xg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
            closed="true" buttons="#dlg-buttons">
        <div class="ftitle">编辑信息</div>
        <form id="fm2" method="post" novalidate>
            <div class="fitem">
                <label>教室编号:</label>
                <input name="roomid" class="easyui-validatebox" required="true">
            </div>
            <div class="fitem">
                <label>教室名称:</label>
                <input name="roomname" class="easyui-validatebox" required="true">
            </div>
            <div class="fitem">
                <label>教室人数:</label>
                <input name="roomsize" class="easyui-validatebox" required="true">
            </div>
            <div class="fitem">
                <label>教室类型:</label>
               <!-- <input name="roomtype" class="easyui-validatebox" required="true" >  -->
               <select>
               <option name="roomtype">机房</option>
               <option name="roomtype">教室</option>
               <option name="roomtype">多媒体</option>
               </select>
            </div>
            
            </div>
        </form>
    </div>
    <div id="dlg-buttons">
        <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">提交</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#xg').dialog('close')">取消</a>
    </div>
</body>
</html>