<%@page import="post.PostDAO"%>
<%@page import="comment.CommentDAO"%>
<%@page import="comment.Comment"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");

	String commentText = request.getParameter("commentText");
	int id = Integer.parseInt(request.getParameter("id"));
	
	Comment comment = new Comment();
	comment.setComment(commentText);
	comment.setNickname((String)session.getAttribute("nickname"));
	comment.setParentid(id);
	
	CommentDAO commentDAO = new CommentDAO();
	commentDAO.put(comment);
	
	PostDAO postDAO = new PostDAO();
	String time = postDAO.getTime(id);
	
	String returnText = "location.href='postView.jsp?id=" + id + "&time=" + time + "';";
	
	out.println("<script>");
	out.println(returnText);
	out.println("</script>");
%>