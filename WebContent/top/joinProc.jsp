<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="username" />
<jsp:setProperty name="user" property="password" />
<jsp:setProperty name="user" property="name" />
<jsp:setProperty name="user" property="nickname" />

<%	
	String tel = request.getParameter("tel");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	
	String phone = tel + "-" + tel1 + "-" + tel2;
	
	user.setPhone(phone);
	
	// 회원가입
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(user);
	
	if(result == -2) {
		out.println("<script>");
		out.println("alert('이미 존재하는 아이디입니다.')"); // 데이터베이스 오류
		out.println("history.back()");
		out.println("</script>");
	} else if(result == -3) {
		out.println("<script>");
		out.println("alert('이미 존재하는 닉네임입니다.')"); // 데이터베이스 오류
		out.println("history.back()");
		out.println("</script>");
	} else if(result == -1) {
		out.println("<script>");
		out.println("alert('데이터베이스 오류입니다.')"); // 데이터베이스 오류
		out.println("history.back()");
		out.println("</script>");
	} else {
		// 회원가입 성공
		out.println("<script>");
		out.println("location.href = '../login.jsp'");
		out.println("</script>");
	}
%>