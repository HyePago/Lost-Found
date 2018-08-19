<%@page import="post.PostDAO"%>
<%@page import="post.Post"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<%
	request.setCharacterEncoding("EUC-KR");

	String savePath = request.getServletContext().getRealPath("img");
	
	int sizeLimit = 1024*1024*15;
	
	MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "EUC-KR", new DefaultFileRenamePolicy());
	
	Post post = new Post();
	post.setDivision(multi.getParameter("division"));
	post.setArea(multi.getParameter("area"));
	post.setTitle(multi.getParameter("title"));
	post.setContent(multi.getParameter("content"));
	post.setUsername((String)session.getAttribute("username"));
	post.setNickname((String)session.getAttribute("nickname"));
	
	String fileName = multi.getFilesystemName("picture");
	
	if(fileName == null) {
		post.setPicture("");
	} else {
		post.setPicture(savePath + "/" + fileName);
	}
	
	if(multi.getParameter("phone") == null) {
		post.setPhone(0);
	} else {
		post.setPhone(1);
	}
	
	// 게시글 올리기
	PostDAO postDAO = new PostDAO();
	int result = postDAO.post(post);
	
	if(result == 1) {
		out.println("<script>");
		out.println("history.go(-2);");
		out.println("</script>");
	} else if(result == -1) {
		out.println("<script>");
		out.println("alert('데이터베이스 오류입니다.')"); // 데이터베이스 오류
		out.println("history.back()");
		out.println("</script>");
	} else { 
		out.println("<script>");
		out.println("alert('실패')"); 
		out.println("history.back()");
		out.println("</script>");
	}
%>