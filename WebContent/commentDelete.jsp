<%@page import="comment.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	int parentid = Integer.parseInt(request.getParameter("parentid"));
	String time = request.getParameter("time");

	CommentDAO commentDAO = new CommentDAO();
	commentDAO.delete(id);
	
	String returnText = "location.href='postView.jsp?id=" + parentid + "&time=" + time + "';";
	
	out.println("<script>");
	out.println(returnText);
	out.println("</script>");
%>