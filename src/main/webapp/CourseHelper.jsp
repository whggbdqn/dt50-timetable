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
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
</head>
<body>
	<script type="text/javascript">
		$(function() {
			var editing; //判断用户是否处于编辑状态 
			var flag; //判断新增和修改方法 
			var number; //标记教室
			var dateTime; //标记日期
			$('#set_schedule')
					.datagrid(
							{
								idField : 'id',
								title : '排课小助手1.0',
								fitColumns : false,
								//url:'getAllScore.s', 
								striped : true,
								loadMsg : '数据正在加载,请耐心的等待...',
								rownumbers : true,
								singleSelect : true,
								frozenColumns : [ [ {
									field : 'id',
									checkbox : true
								} ] ],

								columns : [
										[
												//时间字段跨两行
												{
													field : 'dateTime',
													title : '时间',
													width : 90,
													rowspan : 2,
													align : 'center',
													editor : {
														type : 'datebox',
														options : {
															required : true,
															missingMessage : '时间必填!',
															editable : true,
															onSelect : function(
																	date) {
																var row = $(
																		'#set_schedule')
																		.datagrid(
																				'getSelected');
																//返回指定行的索引号，该行的参数可以是一行记录或一个ID字段值。 
																var rowIndex = $(
																		'#set_schedule')
																		.datagrid(
																				'getRowIndex',
																				row);
																var target = $(
																		'#set_schedule')
																		.datagrid(
																				'getEditor',
																				{
																					'index' : rowIndex,
																					'field' : 'cc1'
																				}).target;
																target
																		.combobox('clear'); //清除原来的数据  	
															}

														}
													},
													formatter : function(value,
															row, index) { //value表示当前值 row表示当前行 index表示行号
														dateTime = row.dateTime;
														var d = new Date(value);
														var str = d
																.getFullYear()
																+ "-"
																+ (d.getMonth() + 1)
																+ "-"
																+ d.getDate();
														return str;
													}

												},
												//教室	
												{
													field : 'cc1',
													title : '教室',
													rowspan : 2,
													width : 63,
													align : 'center',
													editor : {
														type : 'combobox',
														options : {
															required : true,
															missingMessage : '教室必填!',
															url : 'showAllTbClassroom.s',
															valueField : 'roomname',
															textField : 'roomname',

															onSelect : function(
																	data) {
																//返回第一个被选中的行或如果没有选中的行则返回null。
																var row = $(
																		'#set_schedule')
																		.datagrid(
																				'getSelected');
																//返回指定行的索引号，该行的参数可以是一行记录或一个ID字段值。 
																var rowIndex = $(
																		'#set_schedule')
																		.datagrid(
																				'getRowIndex',
																				row);
																/*    获取指定编辑器，options包含2个属性：
																  index：行索引。
																  field：字段名称。 */
																var thisTarget = $(
																		'#set_schedule')
																		.datagrid(
																				'getEditor',
																				{
																					'index' : rowIndex,
																					'field' : 'cc1'
																				}).target;
																var dateTarget = $(
																		'#set_schedule')
																		.datagrid(
																				'getEditor',
																				{
																					'index' : rowIndex,
																					'field' : 'dateTime'
																				}).target;
																//获取下拉列表的值
																var value = thisTarget
																		.combobox('getValue');
																var datevalue = dateTarget
																		.datebox('getValue');
																//获取下一个下拉列表的编辑器 
																var target = $(
																		'#set_schedule')
																		.datagrid(
																				'getEditor',
																				{
																					'index' : rowIndex,
																					'field' : 'aa1'
																				}).target;
																target
																		.combobox('clear'); //清除原来的数据  
																var url = 'getClassBySize.s?name='
																		+ data.roomname
																		+ '&date='
																		+ datevalue;
																target
																		.combobox(
																				'reload',
																				url);//联动下拉列表重载  
															}

														}
													}
												},

												{
													field : 'morningCourse',
													title : '上午8:30-10:30',
													align : 'center',
													colspan : 3,

													editor : {
														type : 'validatebox',
														options : {
															required : true,
															missingMessage : '课程必填!'
														}
													}
												},

												{
													field : 'morningCourse',
													title : '上午10:30-12:30',
													align : 'center',
													colspan : 3,

													editor : {
														type : 'validatebox',
														options : {
															required : true,
															missingMessage : '课程必填!'
														}
													}
												},

												{
													field : 'afternoonCourse',
													title : '下午2:00-4:00',
													align : 'center',
													colspan : 3,

													editor : {
														type : 'validatebox',
														options : {
															required : true,
															missingMessage : '课程必填!'
														}
													}
												},

												{
													field : 'afternoonCourse',
													title : '下午4:00-6:00',
													align : 'center',
													colspan : 3,

													editor : {
														type : 'validatebox',
														options : {
															required : true,
															missingMessage : '课程必填!'
														}
													}
												},
												{
													field : 'evening',
													title : '晚上6:30-8:30',
													align : 'center',
													colspan : 3,

													editor : {
														type : 'validatebox',
														options : {
															required : true,
															missingMessage : '课程必填!'
														}
													}
												} ],
										[

												{
													field : 'aa1',
													title : '班级',
													width : 63,
													editor : {
														type : 'combobox',
														options : {
															required : true,
															missingMessage : '班级必填!',
															// url:'getClassBySize.s?name=一机房', 
															valueField : 'classname',
															textField : 'classname',

															onSelect : function(
																	data) {
																//返回第一个被选中的行或如果没有选中的行则返回null。
																var row = $(
																		'#set_schedule')
																		.datagrid(
																				'getSelected');
																//返回指定行的索引号，该行的参数可以是一行记录或一个ID字段值。 
																var rowIndex = $(
																		'#set_schedule')
																		.datagrid(
																				'getRowIndex',
																				row);
																/*    获取指定编辑器，options包含2个属性：
																  index：行索引。
																  field：字段名称。 */
																var thisTarget = $(
																		'#set_schedule')
																		.datagrid(
																				'getEditor',
																				{
																					'index' : rowIndex,
																					'field' : 'aa1'
																				}).target;
																//获取下拉列表的值
																var value = thisTarget
																		.combobox('getValue');
																//获取下一个下拉列表的编辑器 
																var target = $(
																		'#set_schedule')
																		.datagrid(
																				'getEditor',
																				{
																					'index' : rowIndex,
																					'field' : 'bb1'
																				}).target;
																//同步出后面三个班级
																var target1 = $(
																		'#set_schedule')
																		.datagrid(
																				'getEditor',
																				{
																					'index' : rowIndex,
																					'field' : 'class1'
																				}).target;
																var target2 = $(
																		'#set_schedule')
																		.datagrid(
																				'getEditor',
																				{
																					'index' : rowIndex,
																					'field' : 'class2'
																				}).target;
																var target3 = $(
																		'#set_schedule')
																		.datagrid(
																				'getEditor',
																				{
																					'index' : rowIndex,
																					'field' : 'class3'
																				}).target;
																target
																		.combobox('clear'); //清除原来的数据  

																var url = 'getTeacherByClass.s?name='
																		+ data.classname;
																target
																		.combobox(
																				'reload',
																				url);//联动下拉列表重载  
																target1
																		.textbox(
																				'setValue',
																				data.classname);
																target2
																		.textbox(
																				'setValue',
																				data.classname);
																target3
																		.textbox(
																				'setValue',
																				data.classname);

															}
														}
													}
												},
												{
													field : 'bb1',
													title : '教师',
													width : 63,
													editor : {
														type : 'combobox',
														options : {
															required : true,
															missingMessage : '教师 必填!',
															valueField : 'teachername',
															textField : 'teachername',
															onSelect : function(
																	data) {
																//返回第一个被选中的行或如果没有选中的行则返回null。
																var row = $(
																		'#set_schedule')
																		.datagrid(
																				'getSelected');
																//返回指定行的索引号，该行的参数可以是一行记录或一个ID字段值。 
																var rowIndex = $(
																		'#set_schedule')
																		.datagrid(
																				'getRowIndex',
																				row);
																/*    获取指定编辑器，options包含2个属性：
																  index：行索引。
																  field：字段名称。 */
																var thisTarget = $(
																		'#set_schedule')
																		.datagrid(
																				'getEditor',
																				{
																					'index' : rowIndex,
																					'field' : 'aa1'
																				}).target;
																//获取班级下拉列表选中的文本的值
																var value = thisTarget
																		.combobox('getText');
																var thisTarget1 = $(
																		'#set_schedule')
																		.datagrid(
																				'getEditor',
																				{
																					'index' : rowIndex,
																					'field' : 'bb1'
																				}).target;
																//获取班级下拉列表所有的文本的值
																var obj = thisTarget1
																		.combobox('getData');
																var selectedTeacher = data.teachername; //*******?thisTarget1.combobox('getValue');
																var otherTeacher;
																if (selectedTeacher == obj[0].teachername)
																	otherTeacher = obj[1].teachername;
																if (selectedTeacher == obj[1].teachername)
																	otherTeacher = obj[0].teachername;

																//获取下一个下拉列表的编辑器 
																var target = $(
																		'#set_schedule')
																		.datagrid(
																				'getEditor',
																				{
																					'index' : rowIndex,
																					'field' : 'cource'
																				}).target;
																var target1 = $(
																		'#set_schedule')
																		.datagrid(
																				'getEditor',
																				{
																					'index' : rowIndex,
																					'field' : 'teacher1'
																				}).target;
																var target2 = $(
																		'#set_schedule')
																		.datagrid(
																				'getEditor',
																				{
																					'index' : rowIndex,
																					'field' : 'teacher2'
																				}).target;
																var target3 = $(
																		'#set_schedule')
																		.datagrid(
																				'getEditor',
																				{
																					'index' : rowIndex,
																					'field' : 'teacher3'
																				}).target;
																target
																		.combobox('clear'); //清除原来的数据  
																//传递班级名称和老师姓名
																var url = 'getAllNodeByClass.s?classname='
																		+ value
																		+ '&teachername='
																		+ data.teachername;
																target
																		.combobox(
																				'reload',
																				url);//联动下拉列表重载  
																target1
																		.textbox(
																				'setValue',
																				data.teachername);
																target2
																		.textbox(
																				'setValue',
																				otherTeacher);
																target3
																		.textbox(
																				'setValue',
																				otherTeacher);
															}
														}
													}
												},

												{
													field : 'cource',
													title : '课程内容',
													width : 91,
													align : 'center',
													editor : {
														type : 'combobox',
														options : {
															valueField : 'nodename',
															textField : 'nodename',
															onSelect : function(
																	data) {

																//返回第一个被选中的行或如果没有选中的行则返回null。
																var row = $(
																		'#set_schedule')
																		.datagrid(
																				'getSelected');
																//返回指定行的索引号，该行的参数可以是一行记录或一个ID字段值。 
																var rowIndex = $(
																		'#set_schedule')
																		.datagrid(
																				'getRowIndex',
																				row);
																/*    获取指定编辑器，options包含2个属性：
																  index：行索引。
																  field：字段名称。 */
																var thisTarget = $(
																		'#set_schedule')
																		.datagrid(
																				'getEditor',
																				{
																					'index' : rowIndex,
																					'field' : 'aa1'
																				}).target;
																//获取下拉列表的值
																var value = thisTarget
																		.combobox('getValue');
																//获取下午老师的姓名
																var teacher3Target = $(
																		'#set_schedule')
																		.datagrid(
																				'getEditor',
																				{
																					'index' : rowIndex,
																					'field' : 'teacher3'
																				}).target;
																var teacherValue = teacher3Target
																		.textbox('getText');
																var url = 'getAllNodeByClass.s?classname='
																		+ value
																		+ '&teachername='
																		+ teacherValue;
																var courseTarget = $(
																		'#set_schedule')
																		.datagrid(
																				'getEditor',
																				{
																					'index' : rowIndex,
																					'field' : 'course3'
																				}).target;
																courseTarget
																		.combobox(
																				'reload',
																				url);//联动下拉列表重载  
																//获取下一个下拉列表的编辑器 
																var target = $(
																		'#set_schedule')
																		.datagrid(
																				'getEditor',
																				{
																					'index' : rowIndex,
																					'field' : 'cource'
																				}).target;
																var target1 = $(
																		'#set_schedule')
																		.datagrid(
																				'getEditor',
																				{
																					'index' : rowIndex,
																					'field' : 'cource1'
																				}).target;
																target
																		.combobox('clear'); //清除原来的数据  
																courseTarget
																		.combobox('clear'); //清除原来的数据  
																target1
																		.textbox(
																				'setValue',
																				data.nodename);

															}
														}

													}
												},

												{
													field : 'class1',
													title : '班级',
													width : 63,
													align : 'center',
													editor : {
														type : 'textbox',
														options : {

															valueField : 'name',
															textField : 'name',
														}
													}

												},
												{
													field : 'teacher1',
													title : '教师',
													width : 63,
													align : 'center',
													editor : {
														type : 'textbox',
														options : {

															valueField : 'name',
															textField : 'name',
														}
													}
												},
												{
													field : 'cource1',
													title : '课程内容',
													width : 91,
													align : 'center',
													editor : {
														type : 'textbox',
														options : {

															valueField : 'name',
															textField : 'name',

														}
													}
												},
												{
													field : 'class2',
													title : '班级',
													width : 63,
													align : 'center',
													editor : {
														type : 'textbox',
														options : {

															valueField : 'name',
															textField : 'name',
														}
													}

												},
												{
													field : 'teacher3',
													title : '教师',
													width : 63,
													align : 'center',
													editor : {
														type : 'textbox',
													}
												},
												{
													field : 'course3',
													title : '课程内容',
													width : 91,
													align : 'center',
													editor : {
														type : 'combobox',
														options : {
															valueField : 'nodename',
															textField : 'nodename',
															onSelect : function(
																	data) {
																//返回第一个被选中的行或如果没有选中的行则返回null。
																var row = $(
																		'#set_schedule')
																		.datagrid(
																				'getSelected');
																//返回指定行的索引号，该行的参数可以是一行记录或一个ID字段值。 
																var rowIndex = $(
																		'#set_schedule')
																		.datagrid(
																				'getRowIndex',
																				row);
																/*    获取指定编辑器，options包含2个属性：
																  index：行索引。
																  field：字段名称。 */
																var thisTarget = $(
																		'#set_schedule')
																		.datagrid(
																				'getEditor',
																				{
																					'index' : rowIndex,
																					'field' : 'course4'
																				}).target;
																thisTarget
																		.textbox(
																				'setValue',
																				data.nodename);
															}
														}
													}
												},
												{
													field : 'class3',
													title : '班级',
													width : 63,
													align : 'center',
													editor : {
														type : 'textbox',
														options : {

															valueField : 'name',
															textField : 'name',
														}
													}

												},
												{
													field : 'teacher2',
													title : '教师',
													width : 63,
													align : 'center',
													editor : {
														type : 'textbox',
														options : {

															valueField : 'name',
															textField : 'name',
														}
													}
												},
												{
													field : 'course4',
													title : '课程内容',
													width : 91,
													align : 'center',
													editor : {
														type : 'textbox',
														options : {

															valueField : 'name',
															textField : 'name',
														}
													}
												},
												{
													field : 'eveningClass',
													title : '班级',
													width : 63,
													align : 'center',
													editor : {
														type : 'textbox',
														options : {

															valueField : 'name',
															textField : 'name',
														}
													}

												},
												{
													field : 'eveningTeacher',
													title : '教师',
													width : 63,
													align : 'center',
													editor : {
														type : 'textbox',
														options : {

															valueField : 'name',
															textField : 'name',
														}
													}
												},
												{
													field : 'eveningCourse',
													title : '课程内容',
													width : 91,
													align : 'center',
													editor : {
														type : 'textbox',
														options : {

															valueField : 'name',
															textField : 'name',
														}
													}
												}

										] ],

								//合并单元格
								/*  onLoadSuccess:function(){
								        var merges = [{
								            index:0,
								            rowspan:9
								        }];
								        for(var i=0; i<merges.length; i++)
								            $('#set_schedule').datagrid('mergeCells',{
								                index:merges[i].index,
								                field:'dateTime',
								                rowspan:merges[i].rowspan
								            });
								    }	,	 */
								pagination : false,
								pageSize : 10,
								pageList : [ 5, 10, 15, 20, 50 ],
								//自定义工具栏
								toolbar : [
										{
											text : '新增课程',
											iconCls : 'icon-add',
											handler : function() {

												if (editing == undefined) {
													flag = 'add';
													//1 先取消所有的选中状态 
													$('#set_schedule')
															.datagrid(
																	'unselectAll');
													//2追加一行 

													$('#set_schedule')
															.datagrid(
																	'appendRow',
																	{

																		description : ''
																	});

													//3获取当前页的行号 

													editing = $('#set_schedule')
															.datagrid('getRows').length - 1;
													//4选中并开启编辑状态 
													$('#set_schedule')
															.datagrid(
																	'selectRow',
																	editing);
													var row = $('#set_schedule')
															.datagrid(
																	'getSelected');
													$('#set_schedule')
															.datagrid(
																	'beginEdit',

																	editing);
												}else{
													$.messager.show({
														title : '提示信息',
														msg : '请完成编辑!',
														timeout:1000
													});
													
												}
											}
										},
										{
											text : '修改课程',
											iconCls : 'icon-edit',
											handler : function() {
												var arr = $('#set_schedule')
														.datagrid(
																'getSelections');
												if (arr.length != 1) {
													$.messager.show({
														title : '提示信息',
														msg : '只能选择一条记录进行修改!'
													});
												} else {
													if (editing == undefined) {
														flag = 'edit';
														//根据行记录对象获取该行的索引位置 
														editing = $(
																'#set_schedule')
																.datagrid(
																		'getRowIndex',
																		arr[0]);
														//开启编辑状态 
														$('#set_schedule')
																.datagrid(
																		'beginEdit',
																		editing);
													}else{
														$.messager
														.alert(
																'提示',
																'请先确认|保存！'
																);
													}
												}
											}
										},
										{
											text : '确认|检查',
											iconCls : 'icon-check',
											handler : function() {
												//保存之前进行数据的校验 , 然后结束编辑并改变编辑状态字段 
												if ($('#set_schedule')
														.datagrid(
																'validateRow',
																editing)) {
													$('#set_schedule')
															.datagrid(
																	'endEdit',
																	editing);
													editing = undefined;

													//check 
													var rowsData = $(
															'#set_schedule')
															.datagrid('getRows');
													var json = [];
													var loc;
													$
															.each(
																	rowsData,
																	function(i) {
																		loc = {
																			"cDatetime" : rowsData[i].dateTime,
																			"cClassromm" : rowsData[i].cc1,
																			"cMorning1Class" : rowsData[i].aa1,
																			"cMorning1Teacher" : rowsData[i].bb1,
																			"cMorning1Course" : rowsData[i].cource,
																			"cMorning2Class" : rowsData[i].class1,
																			"cMorning2Teacher" : rowsData[i].teacher1,
																			"cMorning2Course" : rowsData[i].cource1,
																			"cAfternoon1Class" : rowsData[i].class2,
																			"cAfternoon1Teacher" : rowsData[i].teacher3,
																			"cAfternoon1Course" : rowsData[i].course3,
																			"cAfternoon2Class" : rowsData[i].class3,
																			"cAfternoon2Teacher" : rowsData[i].teacher2,
																			"cAfternoon2Course" : rowsData[i].course4,
																			"cEveningClass" : rowsData[i].eveningClass,
																			"cEveningTeacher" : rowsData[i].eveningTeacher,
																			"cEveningCourse" : rowsData[i].eveningCourse,

																		};
																		// alert(loc.cDatetime);
																		json
																				.push(loc);
																	});
													json = JSON.stringify(json); //转换成json数据   
													$
															.ajax({
																type : "post",
																url : "check.s",
																data : "jsonObj="
																		+ json,
																success : function(
																		data) {
																	if (data == "0") {
																		$.messager
																				.alert(
																						'提示',
																						'当天该教室已选请检查后重选！'
																						);
																		if (editing == undefined) {
																			flag = 'edit';
																			var row = $(
																					'#set_schedule')
																					.datagrid(
																							'getSelected');
																			//根据行记录对象获取该行的索引位置 
																			editing = $(
																					'#set_schedule')
																					.datagrid(
																							'getRowIndex',
																							row);
																			//开启编辑状态 
																			$(
																					'#set_schedule')
																					.datagrid(
																							'beginEdit',
																							editing);
																		}
																	}
																	
																	if (data == "1") {
																		$.messager
																				.alert(
																						'提示',
																						'该老师上午已有课！'
																						);
																		if (editing == undefined) {
																			flag = 'edit';
																			var row = $(
																					'#set_schedule')
																					.datagrid(
																							'getSelected');
																			//根据行记录对象获取该行的索引位置 
																			editing = $(
																					'#set_schedule')
																					.datagrid(
																							'getRowIndex',
																							row);
																			//开启编辑状态 
																			$(
																					'#set_schedule')
																					.datagrid(
																							'beginEdit',
																							editing);
																		}
																	}
																	
																	if (data == "2") {
																		$.messager
																				.alert(
																						'提示',
																						'该老师下午已有课！'
																						);
																		if (editing == undefined) {
																			flag = 'edit';
																			var row = $(
																					'#set_schedule')
																					.datagrid(
																							'getSelected');
																			//根据行记录对象获取该行的索引位置 
																			editing = $(
																					'#set_schedule')
																					.datagrid(
																							'getRowIndex',
																							row);
																			//开启编辑状态 
																			$(
																					'#set_schedule')
																					.datagrid(
																							'beginEdit',
																							editing);
																		}
																	}
																	
																}
															});
												}else{
													$.messager.show({
														title : '提示信息',
														msg : '请完成编辑!',
														timeout:1000
													});
													
												}
											}
										},
										{
											text : '删除课程',
											iconCls : 'icon-remove',
											handler : function() {
												var arr = $('#set_schedule')
														.datagrid(
																'getSelections');
												if (arr.length <= 0) {
													$.messager.show({
														title : '提示信息',
														msg : '请选择进行删除操作!'
													});
												} else {
													$.messager
															.confirm(
																	'提示信息',
																	'确认删除?',
																	function(r) {
																		if (r) {

																			var row = $(
																					'#set_schedule')
																					.datagrid(
																							'getSelected');
																			//返回指定行的索引号，该行的参数可以是一行记录或一个ID字段值。 
																			var rowIndex = $(
																					'#set_schedule')
																					.datagrid(
																							'getRowIndex',
																							row);
																			$(
																					'#set_schedule')
																					.datagrid(
																							'deleteRow',
																							rowIndex);
																			editing = undefined;
																		} else {
																			return;
																		}
																	});
												}
											}
										},
										{
											text : '清空',
											iconCls : 'icon-cancel',
											handler : function() {
												$.messager
												.confirm(
														'确认对话框',
														'确认清空？',
														function(r) {
															if (r) {

																
																$('#set_schedule').datagrid(
																		'rejectChanges');
																editing = undefined;
															}

														});
												
												
											}
										},
										{
											text : '保存',
											iconCls : 'icon-save',
											handler : function() {

												if ($('#set_schedule')
														.datagrid(
																'validateRow',
																editing)) {
													$('#set_schedule')
															.datagrid(
																	'endEdit',
																	editing);
													editing = undefined;
													/* 数据入库 开始*/
													var rowsData = $(
															'#set_schedule')
															.datagrid('getRows');
													var json = [];
													var loc;
													$
															.each(
																	rowsData,
																	function(i) {
																		loc = {
																			"cDatetime" : rowsData[i].dateTime,
																			"cClassromm" : rowsData[i].cc1,
																			"cMorning1Class" : rowsData[i].aa1,
																			"cMorning1Teacher" : rowsData[i].bb1,
																			"cMorning1Course" : rowsData[i].cource,
																			"cMorning2Class" : rowsData[i].class1,
																			"cMorning2Teacher" : rowsData[i].teacher1,
																			"cMorning2Course" : rowsData[i].cource1,
																			"cAfternoon1Class" : rowsData[i].class2,
																			"cAfternoon1Teacher" : rowsData[i].teacher3,
																			"cAfternoon1Course" : rowsData[i].course3,
																			"cAfternoon2Class" : rowsData[i].class3,
																			"cAfternoon2Teacher" : rowsData[i].teacher2,
																			"cAfternoon2Course" : rowsData[i].course4,
																			"cEveningClass" : rowsData[i].eveningClass,
																			"cEveningTeacher" : rowsData[i].eveningTeacher,
																			"cEveningCourse" : rowsData[i].eveningCourse,

																		};
																		// alert(loc.cDatetime);
																		json
																				.push(loc);
																	});
													json = JSON.stringify(json); //转换成json数据   
													//alert(json);  
													/*  $('#set_schedule').datagrid({  
													     url: 'insert.s',
													     method: 'post'  ,
													     data:json,
													 })  
													 */
													$
															.ajax({
																type : "post",
																url : "insert.s",
																data : "jsonObj="
																		+ json,
																success : function(
																		data) {
																	if (data == 1){
																		// 消息将显示在顶部中间
																		$.messager.show({
																			title:'我的消息',
																			msg:'保存成功！',
																			timeout:1000,
																			showType:'slide'
																		});

																	$('#set_schedule').datagrid(
																	'rejectChanges');
															editing = undefined;
																	}
																}
															});
												} else {
													$.messager.alert('提示',
															'请先完成编辑！');
												}
												/* 数据入库 结束*/
											}
										},
						/* 				{
											text : '导出Excel',
											iconCls : 'icon-excel',
											handler : function() {

												$.ajax({
													type : "post",
													url : "downloadExcel.s",
													success : function(data) {
														$.messager.alert('提示',
																'正在导出！');
													}
												});

											}
										}, */
										{
											text : '清空录入',
											iconCls : 'icon-drop',
											handler : function() {
												//location.href="deleteAllCourse.s";
															//查看课表前提示保存
												$.messager
														.confirm(
																'确认对话框',
																'确认清空吗？',
																function(r) {
																	if (r) {
																		$
																		.ajax({
																			type : "post",
																			url : "deleteAllCourse.s",
																			success : function(
																					data) {
																				if (data >= 1)
																					$.messager
																							.alert(
																									'提示',
																									'已清空！');
																				if (data == 0)
																					$.messager
																							.alert(
																									'提示',
																									'就是空的！开始排课吧');
																			}
																		});
																	}

																});
												
											}
										},
										{
											text : '预览',
											iconCls : 'icon-look',
											handler : function() {
												//查看课表前提示保存
												$.messager
														.confirm(
																'确认对话框',
																'课表保存了吗？',
																function(r) {
																	if (r) {
																		//location.href = "getAllDate.s";
																		window.open("getAllDate.s");
																	}

																});

											}
										}, {
											text : '导入课程',
											iconCls : 'icon-import',
											handler : function() {

												$('#win').window('open'/* {    
																								  width:630,    
																								    height:400,    
																								    modal:true ,
																								    collapsible:false,
																								    minimizable:false 
																								} */);

												$('#fb').filebox({
													buttonText : '请选择',
													buttonAlign : 'right',
													accept : ".xlsx"
												})

											}
										}

								]
							});

			//导入课程窗口中的文本框
			$('#tb').textbox({
				buttonText : '  文件名',
				icons : [ {
					iconCls : 'icon-tip',
					handler : function(e) {
						$(e.data.target).textbox('setValue', '新课表');
					}
				} ],

				// iconCls:'icon-tip', 
				iconAlign : 'left'
			})
		});

		//提交文件上传的表单

		function sub() {
			$('#ff').form('submit', {
				url : "uploadExcel.s",
				onSubmit : function() {
					var isValid = $(this).form('validate');
					if (!isValid) {
						$.messager.alert('提示', '请选择文件');
					}
					return isValid; // 返回false终止表单提交

				},
				success : function(data) {
					if (data == 1) {
						$.messager.alert('提示', '文件上传成功！');
						$('#win').window("close");
					} else {
						$.messager.alert('警告', '文件上传失败！');
						$('#win').window("close");
					}
				}
			});
		}
	</script>
	<form id="moduleform" method="post">
		<s:hidden name="sureDocumentId" id="sureDocumentId"></s:hidden>

	</form>
	<table id="set_schedule"></table>


	<div id="win" class="easyui-window" title="导入课程" closed="true"
		style="width: 400px; height: 300px; padding: 5px;"
		data-options="iconCls:'icon-import',modal:true,openAnimation:'slide',tools:[{
				text:'帮助',
				iconCls:'icon-help',
				handler:function(){alert('请选择一个Excel文件')}
			}]">

		<br>
		<br>
		<br>
		<br>
		<form id="ff" method="post" enctype="multipart/form-data">
			<center>
				<p>
					<input id="tb" type="text" style="width: 200px" name="fname">
				</p>
			</center>
			<center>
				<p>
					<input id="fb" type="text" style="width: 200px" name="file"
						data-options=" required: true,message: '请选择一个文件' ">
				</p>
			</center>
			<center>
				<p>
					<a id="btn" href="javascript:sub()" class="easyui-linkbutton"
						data-options="iconCls:'icon-ok'">上传</a>
				</p>
			</center>
		</form>
	</div>

</body>
</html>