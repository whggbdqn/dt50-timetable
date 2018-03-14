<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script src="js/jquery-1.8.3.min.js"></script>
<!--jquery.easyui.min.js包含了easyUI中的所有插件-->
<script src="easyui/jquery.easyui.min.js"></script>


</head>
<body>


	<div style="display: none;">
		<form   enctype="multipart/form-data" method="post">
			<div id="text" style="color: #f00;"></div>
			<input type="file" id="file" style="display: none" name="file" >
			<button type="button" onclick="F_Open_dialog()">选择文件</button>
		</form>
	</div>



	<input id="handle_status0" value="" hidden="hidden">
	<input id="handle_status1" value="" hidden="hidden">
	<input id="handle_status2" value="" hidden="hidden">
	<input id="handle_status3" value="" hidden="hidden">
	<input id="handle_status4" value="" hidden="hidden">
	<input id="handle_status5" value="" hidden="hidden">
	<input id="handle_status6" value="" hidden="hidden">
	<input id="handle_status7" value="" hidden="hidden">
	<input id="handle_status8" value="" hidden="hidden">
	<!-- 索引 -->
	<input id="index" value="" hidden="hidden">

	<div id="dd"></div>

	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript">
		$(function(){
				/*表格*/
				$('#dg').datagrid({   
					title:'学生信息',
					pagePosition:'bottom',
					rownumbers:true,
					pagination:true,  //分页控件
					pageSize: 6,  //每页记录条数
					pageList:[6,12,18], //可以设置每页记录条数的列表  
        			beforePageText: '第',//页数文本框前显示的汉字  
        			afterPageText: '页    共 {pages} 页',  
       				displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',     
				    url:'getAllTeachersInfos.s', 
				    rowStyler: function (index, row) {
		                if (hideIndexs.indexOf(index)>=0) { return 'background:red; display:none'; }
		            },
		            fitColumns:true,
				    columns:[[   
				    	{field:'teacherid',title:'教员编号',checkbox:true},
				        {field:'teacherjobnumber',title:'教员工号',width:100},   
				        {field:'teachername',title:'教员姓名',width:100}, 
				        {field:'teacherphone',title:'教员电话',width:100}, 
				        {field:'teacherpwd',title:'教员密码',width:100,hidden:true},
				        {field:'dutiesid',title:'角色信息',width:100,
				        	formatter: function(value,row,index){
								if (value==1){
									return "教员";
								} 
								if(value==2){
									return "班主任";
								}
								if(value==3){
									return "排课老师";
								}else{
									return "校长";
								}
							}
				        }, 
				        {field:'teachersex',title:'教员性别',width:100,
				        	formatter: function(value,row,index){
								if (value==1){
									return "男";
								} else {
									return "女";
								}
							}
				        },
				        {field:'teacherstate',title:'在职状态',width:100,
				        	formatter: function(value,row,index){
								if (value==1){
									return "在职";
								} else {
									return "离职";
								}
							}	
				        },
				        {field:'teacherintime',title:'入职日期',width:150,align:'center',
				        	formatter: function(value,row,index){
				               var d=new Date(value);
				               var m=d.getMonth()+1;
				               var mm="";
				               var dd=d.getDate();
				               var CurrentDate ="";
				               if(m<10){
				            	mm="0"+m;
				               }else{
				            	   mm=""+m;
				               }
				               if(dd<10){
				            	   CurrentDate ="0"+dd;
				               }else{
				            	   CurrentDate=""+dd;
				               }
				               
				               var str=d.getFullYear()+"年"+mm+"月"+CurrentDate+"日";
								
				               return str;
							}
				        }
				        
				    ]],  
       				toolbar: [{
       					text:'移除教员',
       					iconCls: 'icon-remove',
       					handler: function(){    //删除
       						var  info= $('#dg').datagrid('getSelections');  //行信息返回数组
       						if(info!=""){
       							//找出每一行的索引
	       						var rowIndex=new Array(); //定义一个装载每一行索引的数组
	       						var teacherIds=[]; 	//定义一个装载教员id的数组
	       						for (var i = 0; i < info.length; i++) {
	       							rowIndex[i]=$('#dg').datagrid('getRowIndex',info[i]); 
	       							teacherIds.push(info[i].teacherid);
								}
	       						//调用删除函数
	       						del(teacherIds,rowIndex);
							}else{
								$.messager.alert('提示信息','请选择要删除的行');
							}	
	       						
       						
       					}
       				},{
       					text:'录入教员',
       					iconCls: 'icon-add',
       					handler: function(){
       						/* showiframe(); */
       						$('#dd').dialog({   
       						    title: '录入教员信息',   
       						    width: 450,   
       						    height: 600,   
       						    closed: false,   
       						    cache: false,   
       						    href: 'addTeacher.jsp',   
       						    modal: true,
       							onClose:function(){
       								/*给表格添加值*/
       							}
       						});  
       					}
       				},{
       					text:'编辑教员',
       					iconCls: 'icon-edit',
       					handler: function(){
       						var tbTeacherInfos=$('#dg').datagrid('getSelected');  //返回一行记录
       						
       						if(tbTeacherInfos!=null){
       									//返回行的索引
       									var index=$('#dg').datagrid('getRowIndex',tbTeacherInfos);
       									$("#index").val(index);
       									//执行修改
       									update(tbTeacherInfos);
       						}else{
       							$.messager.alert('提示信息','请选择要编辑的对象');
       						}
       					}
       				},{
       					text:'取消操作',
       					iconCls: 'icon-cancel',
       					handler: function(){
       						
       						$('#dg').datagrid('clearSelections'); 
       					}
       				},{
       					text:'导出Excel',
       					iconCls: 'icon-redo',
       					handler: function(){
							/*导出Excel*/
							$.messager.confirm('提示框','确定要导出吗?',function(r){   
							    if (r){   
							    	location.href='downloadExcel.s';  
							    }   
							});  
       					}
       				},{
       					text:'导入Excel',
       					iconCls: 'icon-undo',
       					handler: function(){
							/*导入Excel*/
							F_Open_dialog();   //选择文件
							
							$("#file").change(function(){
									//获取文件的位数判断
									var strExcel=$("#file").val();
									var excel=strExcel.substring(strExcel.lastIndexOf("."));
									if(excel==".xlsx"){
										var fileObj = document.getElementById("file").files[0]; // js 获取文件对象
						               if (typeof (fileObj) == "undefined" || fileObj.size <= 0) {
						                   alert("请选择excel文件");
						                   return;
						               }
						               var formFile = new FormData();
						               formFile.append("action", "UploadVMKImagePath");  
						               formFile.append("file", fileObj); //加入文件对象
						 
					               //第一种  XMLHttpRequest 对象
					               //var xhr = new XMLHttpRequest();
					               //xhr.open("post", "/Admin/Ajax/VMKHandler.ashx", true);
					               //xhr.onload = function () {
					               //    alert("上传完成!");
					               //};
					               //xhr.send(formFile);
					 
					               //第二种 ajax 提交
					 
					               var data = formFile;
					               $.ajax({
					                   url: "exclImport.s",
					                   data: data,
					                   type: "Post",
					                   dataType: "json",
					                   cache: false,//上传文件无需缓存
					                   processData: false,//用于对data参数进行序列化处理 这里必须false
					                   contentType: false, //必须
					                   success: function (result) {
					                	   $.messager.show({
												title:'提示信息',
												msg:result.successMessage,
												width:200,
												timeout:500,
												showSpeed:500,
												showType:null,
											 	style:{
											    }
											});
					                   },
					                   error:function(result){
					                	   $.messager.show({
												title:'提示信息',
												msg:result.errorMessage,
												width:200,
												timeout:500,
												showSpeed:500,
												showType:null,
											 	style:{
											    }
											});
					                   }
					               });
								}else{
									$.messager.show({
										title:'提示信息',
										msg:'请选择合适的excel文件',
										width:200,
										timeout:1000,
										showSpeed:1000,
										showType:null,
									 	style:{
									    }
									});
								}
							});
							
       					}/*handler结束*/
       				},{
       					text:'保存操作',
       					iconCls: 'icon-save',
       					handler: function(){
       						$('#dg').datagrid('acceptChanges'); 
       						$.messager.alert('提示信息','保存成功');
       					}
       				}],
       				
       				
				}); 
			
				
				
				
				
				var hideIndexs = new Array();
				//样式
				$('#ss').searchbox({  
					width: 200,
		        	searcher: function (value) {
		            hideIndexs.length = 0;
		            if (value == '请输入查询内容') {
		                value = '';
		            }
		            //结束datagrid的编辑.
		            endEdit();
	          	  var rows = $('#dg').datagrid('getRows');

	           	 var cols = $('#dg').datagrid('options').columns[0];

	            for (var i = rows.length - 1; i >= 0; i--) {
	                var row = rows[i];
	                var isMatch = false;
	                for (var j = 0; j < cols.length; j++) {

	                    var pValue = row[cols[j].field];
	                    if (pValue == undefined) {
	                        continue;
	                    }
	                    if (pValue.toString().indexOf(value) >= 0) {
	                        isMatch = true;
	                        break;
	                    }
	                }
	                if (!isMatch)
	                    hideIndexs.push(i);
		//刷新行,否则不能看到效果.
	                $('#dg').datagrid('refreshRow', i);
		        }
		
			        },
			        menu:'#mm',
			        prompt: '请输入查询内容'  
				});  
		
		
		});
		/*加载函数结束*/
		
		
		
		
		/*删除函数*/
		function del(teacherIds,rowIndex){
			$.messager.confirm('提示框', '你确定要删除吗?',function(r){
				if(r){
					//删除
					for (var i = rowIndex.length-1; i >=0; i--) {
						$('#dg').datagrid('deleteRow',rowIndex[i]);   //删除一个行
					}
					//把数组转化为字符串
					var teacherIdsStr="";
					for (var i = 0; i < teacherIds.length; i++) {
						teacherIdsStr=teacherIdsStr+teacherIds[i]+",";
					}			
					teacherIdsStr=teacherIdsStr.substring(0,teacherIdsStr.length-1);
					
					$.post("delTeachers.s",{"teacherIds":teacherIdsStr},function(data){
						if(data>0){
							$.messager.show({
								title:'提示信息',
								msg:'删除成功',
								width:200,
								timeout:500,
								showSpeed:500,
								showType:null,
							 	style:{
							    }
							});

						}else{
							$.messager.show({
								title:'提示信息',
								msg:'删除失败',
								width:200,
								timeout:500,
								showSpeed:500,
								showType:null,
							 	style:{
							    }
							});
						}
					});
					
					
				}
			})

		}
		
		
			/*dialog*/
		   function go_dlg(){
			     $("#dd").dialog("close");
			 }
			
			/*dialog添加*/
			function add(data){
				$('#dg').datagrid('insertRow',{
					index: 0,	// index start with 0
					row: {
						teacherid:data.teacherid,
						teachername:data.teachername,
						teacherphone: data.teacherphone,
						teacherjobnumber:data.teacherjobnumber,
						teacherpwd:data.teacherpwd,
						dutiesid:data.dutiesid,
						teachersex:data.teachersex,
						teacherstate:data.teacherstate,
						teacherintime:data.teacherintime
					}
				});
			}	
			
			/*dialog修改*/
		   function updateRow(data,index){
			   $('#dg').datagrid('updateRow',{
					index: index,	// index start with 0
					row: {
						teacherid:data.teacherid,
						teachername:data.teachername,
						teacherphone: data.teacherphone,
						teacherjobnumber:data.teacherjobnumber,
						teacherpwd:data.teacherpwd,
						dutiesid:data.dutiesid,
						teachersex:data.teachersex,
						teacherstate:data.teacherstate,
						teacherintime:data.teacherintime
					}
				});
			}
		/*添加*/
		function showiframe(){     
			layer.open({
				  type: 2,
				  area: 'auto',
				  content: 'addTeacher.jsp' ,//这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
				  area: ['500px','500px'],//自定义文本域宽高
				  success:function(layero,index){
					  
			      },
			      end:function(){
			    	  var handle_status = $("#handle_status").val();
			            if ( handle_status == '1' ) {
			            	$.messager.show({
								title:'提示信息',
								msg:'添加成功',
								width:200,
								timeout:500,
								showSpeed:500,
								showType:null,
							 	style:{
							    }
							});
			            	
			            	//location.reload();
			            } else if ( handle_status == '2' ) {
			            	$.messager.show({
								title:'提示信息',
								msg:'添加失败',
								width:200,
								timeout:500,
								showSpeed:500,
								showType:null,
							 	style:{
							    }
							});
			            }
			      }
			      
			}); 
		}
		
		/*修改*/
		function update(tbTeacherInfos){   
			var  arr=[];
			//给arr数组传值
			arr.push(tbTeacherInfos.teachername);
			arr.push(tbTeacherInfos.teacherjobnumber);
			arr.push(tbTeacherInfos.teacherstate);
			
			arr.push(tbTeacherInfos.dutiesid);
			
			arr.push(tbTeacherInfos.teacherintime);
			
			arr.push(tbTeacherInfos.teachersex);
			arr.push(tbTeacherInfos.teacherid);
			
			arr.push(tbTeacherInfos.teacherpwd);
			
			arr.push(tbTeacherInfos.teacherphone);
			
			
			/* layer.open({
				  type: 2,
				  area: 'auto',
				  content: 'updateTeacher.jsp' ,//这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
				  area: ['500px','500px'],//自定义文本域宽高
				  success: function(layero, index){
					var body = layer.getChildFrame('body',index);//建立父子联系
			        var iframeWin = window[layero.find('iframe')[0]['name']];  
			        
					body.find("[name='teachername']").val(arr[0]);
					body.find("[name='teacherjobnumber']").val(arr[1]);
					body.find("[name='teacherstate']").val(arr[2]);
					body.find("[name='dutiesid']").val(arr[3]);
					body.find("[name='teacherintime']").val(arr[4]);
					body.find("[name='teachersex']").val(arr[5]);
					body.find("[name='teacherid']").val(arr[6]);
					body.find("[name='teacherpwd']").val(arr[7]);
					body.find("[name='teacherphone']").val(arr[8]);
				  },
				  end:function(){  //弹层关闭之后调用的函数
			    	  var handle_status = $("#handle_status").val();
			            if ( handle_status == '1' ) {
			            	$.messager.alert('提示信息','修改成功');
			               
			            	location.reload();
			            } else if ( handle_status == '2' ) {
			            	$.messager.alert('提示信息','修改失败');
			            }
			      }
				});  */
				
				/* var url="updateTeacher.jsp";//设置URL

		       var layout="dialogWidth=600px;dialogHeight=500px;scroll=no;status=no;help=no;center=yes";//设置Dialog布局样式

		       var son=window.showModalDialog(url,arr,layout); *///设置son获取Dialog传递过来的值
		       $('#dd').dialog({
		    	   width:450,
		    	   height:600,
		    	   title:'修改教员信息',
		    	   href:'updateTeacher.jsp',
		    	   modal:true,
		    	   onOpen:function(){
			    	   //在主页面上设置一个隐藏的input，在此给赋值，然后让dialog进行取值，传递给后台查询角色对应的菜单
			    	 	for(var i=0;i<arr.length;i++){
			    	 		 $("#handle_status"+i).val(arr[i]);
			    	 	}
		    	   }
		       });
			
		}
		
		
		  
		
		function endEdit() {
			   var rows = $('#dg').datagrid('getRows');
			   for (var i = 0; i < rows.length; i++) {
			       $('#dg').datagrid('endEdit', i);
			   }
			}
			
		
		
		
		function F_Open_dialog() 
		{ 
		document.getElementById("file").click(); 
			
		}
		
		
		
	</script>

	<!-- 查询 -->
	<input id="ss"></input>
	<div id="mm" style="width: 120px">
		<div data-options="name:'all',iconCls:'icon-ok'">按姓名查询</div>
		<div data-options="name:'teacherjobnumber'">教员工号</div>
	</div>

	<!-- 表格 -->
	<table id="dg"></table>
</body>
</html>