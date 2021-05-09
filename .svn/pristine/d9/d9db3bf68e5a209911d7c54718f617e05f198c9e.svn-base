<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.MemberVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eclass_2021. 3. 16.</title>
</head>
<body>
	<h2></h2>
	<hr/>
	<%
	MemberVO member  = (MemberVO)session.getAttribute("memberInfo"); 
	String id = member.getM_id();
	String pw = member.getM_passwd();
	String addr = member.getM_addr();
	String name = member.getM_name();
	String card = member.getM_card();
	%>
	
	<h2><%=id%></h2>
	<h2><%=pw%></h2>
	<h2><%=addr%></h2>
	<h2><%=name%></h2>
	<h2><%=card%></h2>
	
	
	<div></div>
</body>
</html>
