<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(function() {
		$("#but").click(function() {
		//var a=	$("form[name=form1]").submit();
			
		
		 	$.post("teacherskshow.s", $("#form1").serialize(), function(data) {
				if (data > 0) {
					alert("添加成功");
					location.href = 'Zclass.jsp'
				} else {
					alert("添加成功");
				}
			}); 

		});

	});
</script>
<title>Insert title here</title>
<style type="text/css">
.hide {
	display: none;
}

.container {
	border: 1px solid #ccc;
	border-radius: 4px;
	margin: 40px auto;
	padding: 40px;
	width: 800px;
}

.temp_page.window {
	background: rgba(0, 0, 0, 0)
		linear-gradient(to bottom, #ff9c13 0px, #ffcf5c 20%) repeat-x scroll 0
		0;
	border: 1px solid #ffcf5c;
}

.temp_page.panel-title {
	color: #fff
}

.temp_page.window.window-body {
	border: 1px solid #fff;
	padding: 10px;
}
</style>
</head>
<body class="temp_page">
	<div id="d1" class="easyui-dialog" title="欢迎你"
		style="width: 400px; height: 400px;"
		data-options="resizable:false,modal:true">
		<p>
			<form id="form1" name="form1" method="post" >
		   	<p>

			班级:<select name="classname" class="easyui-combobox"
					style="width:150px"
					data-options="
            valueField: 'classid',  //ID
            textField: 'classname',
            url: 'showclass.s',
            method: 'get',
             onSelect: function(rec){   
            }
        "></select>
		</p><br/>
		<p>
			教师:<select name="teachername" class="easyui-combobox"
					style="width:150px"
					data-options="
            valueField: 'teacherid',  //ID
            textField: 'teachername',
            url: 'showteacher.s',
            method: 'get',
             onSelect: function(rec){   
            }
        "></select>
		</p><br/>
			<p>
			<input type="button" id="but" value="提交">
		</p>
			</form>
	</div>
</body>
</html>