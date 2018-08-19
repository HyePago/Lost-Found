<%@page import="post.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	String time = request.getParameter("time");

	PostDAO postDAO = new PostDAO();
	
	postDAO.deletePost(id);
	
	String returnText = "location.href='index.jsp';";
	
	out.println("<script>");
	out.println(returnText);
	out.println("</script>");
%>