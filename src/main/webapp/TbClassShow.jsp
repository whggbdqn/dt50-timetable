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
<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>

</head>
<body>
<div style="padding:5px;background:#fafafa;border:1px solid #ccc;">
<a id="delMore" class="easyui-linkbutton" iconCls="icon-cancel">删除</a>
<a onclick="addClass()" class="easyui-linkbutton" iconCls="icon-add">添加</a>
<a onclick="selectOne()" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
<!-- <input type="text" name="selectClass" >
<input type="button" value="查询" name="selectBtn"> -->
</div>
<table id="dg" width=""></table> 

<!-- 添加成功后弹框交互 -->
<input type="hidden" value="" id="close">
<input type="hidden" value="" id="closeUp">

<div id="main" style="height:300px"></div>
</body>
</html>
<script>
// $.fn.datebox.defaults.formatter = function(value){
// 	var date = new Date(value);
// 	var y = date.getFullYear();
// 	var m = date.getMonth()+1;
// 	var d = date.getDate();
// 	return y+'-'+m+'-'+d;
// }

//查单条+修改
function selectOne(){
	$('#dg').datagrid('selectRow');
	var row=$('#dg').datagrid('getSelected');
	var cId = row.classid;
	if(row==null){  
		layer.open({
			  type: 1, 
			  area: 'auto',
			  content: '<p style="text-align: center;">请至少选择一行数据!</p>', //这里content是一个普通的String
			  area:['250px','170px'],
			  btn:['取消']
			});  
		return false;  
	}
	
	var arr = [];
	arr.push(row.classid);
	arr.push(row.classname);
	arr.push(row.totalnum);
	arr.push(row.beginyear);
	//alert(row.beginyear);
	if(row.classtype=="java"){
		arr.push(0);
	}else{
		arr.push(1);
	}
	
	layer.open({
		  type: 2, 
		  area: 'auto',
		  content: 'selectByPrimaryKey.s?i='+cId, //这里content是一个普通的String
		  //content: 'oneClass.jsp', //这里content是一个普通的String
		  area:['400px','400px'],
		  success: function(layero, index){
// 			  var body = layer.getChildFrame('body', index);     //建立父子关系
// 			  var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method(); 
			  
// 			  body.find("[name=classid]").val(arr[0]);
// 			  body.find("[name=classname]").val(arr[1]);
// 			  body.find("[name=totalnum]").val(arr[2]);
// 			  body.find("[name=beginyear]").val(arr[3]);
// 			  body.find("[name=classtype]").val(arr[4]);
			  
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
				 
			  }
		  }
		  
		});
	
}
//添加
function addClass(){
	layer.open({
		  type: 2, 
		  area: 'auto',
		  content: 'addClass.jsp', //这里content是一个普通的String
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
				 
			  }
		  }
		});
}
$(function(){
	
	//删除
	$("#delMore").click(function(){
		var ids = [];
		var rows = $('#dg').datagrid('getSelections');
		if(rows.length==0){  
			 $.messager.alert('提示','请至少选择一行','info');
			return false;  
			}
		
		for(var i=0;i<rows.length;i++){
			var id=rows[i].classid;
			ids.push(id);
		}
		var str = ids.join(",");
		//alert(str);
		$.messager.confirm('确认提交','您确认删除该资源？',function(r){  
			if (r){  
					$.ajax({
						type:"post",
						url:"delClassWhenState.s",
						data:{"classid":str},
						success:function(data){
							if(data>0){
								$('#dg').datagrid("reload"); 
							    $.messager.alert('提示','删除成功!','info');
							}else{
								$.messager.alert('提示','在读状态，还未毕业，不可删除','info');
							}
						},
						error: function(){
				            $.messager.alert('错误','删除出错!','error');                                
				    	}
					});
				 //$('#dg').datagrid('deleteRow');  
			}  
	   });
	});
	
		//查询班级对应的老师
		$("input[name='selectBtn']").click(function(){
			var sel = $("input[name='selectClass']").val();
			//alert(sel);
			$('#dg').datagrid({   
				title:'<span>班级教员信息</span>',
				pagination:true,//分页控件  
				//pageSize: 5,//每页显示的记录条数，默认为10  
				pageList: [5,10],//可以设置每页记录条数的列表
				beforePageText: '第',//页数文本框前显示的汉字  
	    		afterPageText: '页    共 {pages} 页',  
	   			displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录', 
			    url:'getClassAndTeacher.s?className='+sel,   
			    columns:[[     
			    	{field:'tbClass.classname',
			        	formatter: function(value,row,index){
			        		//alert(row);
			        		return row.tbClass.classname;
			        		//return value;
			        	},
			     		title:'班级名称',width:100},
			     	 	{field:'tbTeacher.teachername',
				        	formatter: function(value,row,index){
				        		return row.tbTeacher.teachername;
				        		//return value;
				        	},
				        	title:'教员名称',width:100}		
			        
			    ]]  
	   			
			});  
		});
		
		//显示所有在读班级
		$('#dg').datagrid({   
			title:'<span>班级信息</span>',
			pagination:true,//分页控件  
			pageSize: 10,//每页显示的记录条数，默认为10  
			pageList: [10,20],//可以设置每页记录条数的列表
			beforePageText: '第',//页数文本框前显示的汉字  
    		afterPageText: '页    共 {pages} 页',  
   			displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录', 
		    url:'getAllClass.s',   
		    columns:[[   
		        {field:'classid',title:'班级编号',checkbox:true},   
		        {field:'classname',title:'班级名称',width:200},   
		        {field:'totalnum',title:'班级总人数',width:200},
		        {field:'beginyear',title:'开班时间',width:200,
		        formatter: function(value,row,index){
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
		        {field:'classtype',title:'班级类型',width:200,
		        	formatter: function(value,row,index){
						if (row.classtype==2){
							return "ui";
						} else {
							return "java";
						}
					}
		        }
		     
		    ]]
		   
   			
		});  
});
</script>