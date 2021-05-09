<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eclass_2021. 3. 17.</title>
</head>
<body>
	<h2></h2>
	<hr/>
	<% session.invalidate();%>
	<script>
	var listUrl ="/HAO/project/project.do?" 
	   			  + "work_div=doRetrieve" 
	    		 + "&search_div=40";
	console.log("listUrl:"+listUrl);
	
	window.location.href=listUrl;
	</script>
	<div></div>
</body>
</html>

