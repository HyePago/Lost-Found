<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
	<%
		request.setCharacterEncoding("EUC-KR");
	%>
<jsp:forward page="main.jsp">
	<jsp:param value="testSearch.jsp" name="CONTENTPAGE"/>
</jsp:forward>