<%@ page import="org.apache.log4j.Logger" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--
	response는 request 기본 객체와 반대의 기능을 수행
	웹 브라우저에 전송할 내용을 담을 수 있다

	- 헤더 정보 입력 : Cache Control
	- 리다이렉트	
 --%>

		<%
			// ContextPath : /WEB_H01
			String cPath = request.getContextPath();
			request.setAttribute("cPath", cPath);
		
			// Logger 생성
			Logger LOG = Logger.getLogger(this.getClass());
		
			// HTTP 1.1에서 지원하는 헤더 : 웹 브라우저가 응답결과를 캐시하지 않음
			response.setHeader("Cashe-Control", "no-cache");
		
			// 웹 브라우저가 응답결과를 캐시하지 않음(앞/뒤로 가기)
			response.setHeader("Cashe-Control", "no-store");
			
			// HTTP 1.0 : 웹 브라우저가 응답결과를 캐시하지 않음
			response.setHeader("Pragma", "no-cache");
			
			// HTTP 1.0 : 현재시간 이전으로 캐시하지 않음
			response.setHeader("Expires", "1L");
		%>