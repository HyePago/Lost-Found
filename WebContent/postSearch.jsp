<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--  
<jsp:forward page="main.jsp">
	<jsp:param value="post/postSearch.jsp" name="CONTENTPAGE"/>
</jsp:forward>
-->

<%
request.setCharacterEncoding("UTF-8");
	
	// request
	String select = request.getParameter("select");
	String searchText = request.getParameter("searchText");
	
	out.println(select);
	out.println(searchText);
	%>