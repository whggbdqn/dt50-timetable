<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="layer/theme/default/layer.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>
</head>
<body>
	
	<input type="hidden" value="" id="close"/>
	
	<div title="class" style="padding: 20px;">
		<table id="dg" width="1200"></table> 
	</div>
</body>
</html>
<script type="text/javascript">
//添加
function addSuggestion(){
	layer.open({
		  type: 2, 
		  title: '添加建议',
		  area: 'auto',
		  shadeClose: false, //点击遮罩关闭
		  content: 'TbSuggestionAdd.jsp', //这里content是一个普通的String
		  area:['400px','320px'],
		  end:function(){
			  //取出子页面传过来值
			   var val=$("#close").val();
			  if(val=="1"){
				  layer.alert('添加成功', {
						icon: 1,
						title: "提示",
						time: 1000
						});
				 
			  }else{ 
				  layer.alert('添加失败', {
						icon: 2,
						title: "提示",
						time: 1000
						});
			  }
		  }
		  
		});
		
}

	$(function(){
		
		
		
		
		function replaceSuggestion(){
			layer.open({
				  type: 2, 
				  title: '更换班级',
				  area: 'auto',
				  shadeClose: false, //点击遮罩关闭
				  content: 'TbSuggestionReplace.jsp', //这里content是一个普通的String
				  area:['400px','320px'],
				  end:function(){
					  //取出子页面传过来值
					   var val=$("#close").val();
					  if(val=="1"){
						  layer.alert('更换成功', {
								icon: 1,
								title: "提示",
								time: 1000
								});
						 
					  }else{ 
						  layer.alert('更换失败', {
								icon: 2,
								title: "提示",
								time: 1000
								});
					  }
				  }
				  
				});
				
		}

		
	        $('#dg').datagrid({ 
	            title:'建议信息',
	            pagination:true,//分页控件  
	            pageSize: 8,//每页显示的记录条数，默认为10  
     			pageList: [8,12],//可以设置每页记录条数的列表  
      		beforePageText: '第',//页数文本框前显示的汉字  
      		afterPageText: '页    共 {pages} 页',  
     			displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',     
			    url:'getAllSuggestion1.s',   
			    columns:[[   
			        {field:'',width:100,checkbox:true},
			        {field:'tbTeacher.teachername',
			        	formatter: function(value,row,index){
			        		return row.tbTeacher.teachername;
			        	},
			        	title:'教师姓名',width:100},
			        {field:'suggestionid',title:'意见编号',width:100},   
			        {field:'suggestiontitle',title:'意见标题',width:100},  
			        {field:'suggestioncontent',title:'意见内容'},  
			        {field:'releasetime',title:'发布日期',width:100,
			        formatter: function(value,row,index){ //value表示当前值 row表示当前行 index表示行号
	                        var date = new Date(value);
	                        var y = date.getFullYear();
	                        var m = date.getMonth() + 1;
	                        var mm="";
	                        if(m<10){
	                        	mm="0"+m;
	                        }else{
	                        	mm=""+m;
	                        }
	                        var d = date.getDate();
	                        var dd="";
	                        if(d<10){
	                        	dd="0"+d;
	                        }else{
	                        	dd=""+d;
	                        }
	                        return y + '-' +mm+ '-' + dd;
	                    }        
			        },   
			        {field:'teacherid',title:'教师编号',width:100},   
			    ]],
			    toolbar: [{
   					text:'删除意见',
   					iconCls: 'icon-remove',
   					handler: function(){    //删除
   						var  info= $('#dg').datagrid('getSelections');  //行信息返回数组
   						if(info!=""){
   							//找出每一行的索引
       						var rowIndex=new Array(); //定义一个装载每一行索引的数组
       						var suggestionID=[]; 	//定义一个装载教员id的数组
       						for (var i = 0; i < info.length; i++) {
       							rowIndex[i]=$('#dg').datagrid('getRowIndex',info[i]); 
       							suggestionID.push(info[i].suggestionid);
							}
       						//调用删除函数
       						del(suggestionID,rowIndex);
						}else{
							$.messager.alert('Warning','未选择要删除的行');
							setTimeout(function(){
								  $(".messager-body").window('close');  
								},2000);
						}	
       						
   						
   					}
   				},{
   					text:'添加意见',
   					iconCls: 'icon-add',
   					handler: function(){
   						addSuggestion();
   					}
   				},{
   					text:'修改意见',
   					iconCls: 'icon-edit',
   					handler: function(){
   						$('#dg').datagrid('selectRow');
   						var row=$('#dg').datagrid('getSelected');
   						if(row==null){  
   							layer.open({
   								  type: 1, 
   								  area: 'auto',
   								  content: '<p style="text-align: center;">请至少选择一行数据!</p>', //这里content是一个普通的String
   								  area:['250px','150px'],
   								  btn:['取消']
   								});  
   							return false;  
   						}
   						//得到行号
   						//var i=row.classid;
   						
   						var arr = [];
   						arr.push(row.suggestionid);
   						arr.push(row.suggestiontitle);
   						arr.push(row.suggestioncontent);
   						arr.push(row.releasetime);
   						arr.push(row.teacherid);
   						
   						layer.open({
   							  type: 2,
   							  title: '修改建议',
   							  area: 'auto',
   							  content: 'TbSuggestionOne.jsp', //这里content是一个普通的String
   							  area:['400px','450px'],
   							  success: function(layero, index){
   								  var body = layer.getChildFrame('body', index);     //建立父子关系
   								  var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method(); 
   								  
   								  body.find("[name=suggestionid]").val(arr[0]);
   								  body.find("[name=suggestiontitle]").val(arr[1]);
   								  body.find("[name=suggestioncontent]").val(arr[2]);
   								  body.find("[name=releasetime]").val(arr[3]);
   								  body.find("[name=teacherid]").val(arr[4]);
   							  },
   							end:function(){
   							  //取出子页面传过来值
   							   var val=$("#close").val();
   							  if(val=="1"){
   								  layer.alert('修改成功', {
   										icon: 1,
   										title: "提示",
   										time: 1000
   										});
   								
   								 
   							  }else{ 
   								  layer.alert('修改失败', {
   										icon: 2,
   										title: "提示",
   										time: 1000
   										});
   							  }
   						  }
   							  
   							});
   						
   					}
   				},{
   					text:'更换教室',
   					iconCls: 'icon-cancel',
   					handler: function(){
   						replaceSuggestion();
   					}
   				},{
   					text:'添加课程',
   					iconCls: 'icon-save',
   					handler: function(){alert('help')}
   				}],
   	
			}); 
	   }); 
	
	/*修改*/
	/* function update(tbSuggestion1){
		$('#dg').datagrid('selectRow');
		var row=$('#dg').datagrid('getSelected');
		if(row==null){  
			layer.open({
				  type: 1, 
				  area: 'auto',
				  content: '<p style="text-align: center;">请至少选择一行数据!</p>', //这里content是一个普通的String
				  area:['250px','150px'],
				  btn:['取消']
				});  
			return false;  
		}
		//得到行号
		//var i=row.classid;
		
		var arr = [];
		arr.push(row.suggestionid);
		arr.push(row.suggestiontitle);
		arr.push(row.suggestioncontent);
		arr.push(row.releasetime);
		arr.push(row.teacherid);
		
		layer.open({
			  type: 2, 
			  area: 'auto',
			  content: 'TbSuggestionOne.jsp', //这里content是一个普通的String
			  area:['400px','350px'],
			  success: function(layero, index){
				  var body = layer.getChildFrame('body', index);     //建立父子关系
				  var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method(); 
				  
				  body.find("[name=suggestionid]").val(arr[0]);
				  body.find("[name=suggestiontitle]").val(arr[1]);
				  body.find("[name=suggestioncontent]").val(arr[2]);
				  body.find("[name=releasetime]").val(arr[3]);
				  body.find("[name=teacherid]").val(arr[4]);
			  },
			  btn:['取消']
			  
			});
		
	} */
	
	/*删除函数*/
	function del(suggestionID,rowIndex){
		$.messager.confirm('提示框', '你确定要删除吗?',function(r){
			if(r){
				
				//删除
				for (var i = rowIndex.length-1; i >=0; i--) {
					$('#dg').datagrid('deleteRow',rowIndex[i]);   //删除一个行
				}
				//把数组转化为字符串
				var suggestionIdsStr="";
				for (var i = 0; i < suggestionID.length; i++) {
					suggestionIdsStr=suggestionIdsStr+suggestionID[i]+",";
				}			
				suggestionIdsStr=suggestionIdsStr.substring(0,suggestionIdsStr.length-1);
				
				$.post("delMoreSuggestion.s",{"suggestionID":suggestionIdsStr},function(data){
					if(data>0){
						$.messager.alert('Warning','删除成功');
						setTimeout(function(){
							  $(".messager-body").window('close');  
							},1000);
					}else{
						$.messager.alert('Warning','删除失败');
					}
				});
				
				
			}
		})

	}
		
	</script>