<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="username" />
<jsp:setProperty name="user" property="password" />

<%	
	// 로그인
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(user.getUsername(), user.getPassword());
	
	if(result == 1) { // 로그인 성공
		// 회원가입 성공
		session.setAttribute("username", user.getUsername());
		String nickname = userDAO.getNickname(user.getUsername());
		session.setAttribute("nickname", nickname);
		out.println("<script>");
		out.println("location.href = '../index.jsp'");
		out.println("</script>");
	} else if(result == -2) { // 데이터베이스 오류
		out.println("<script>");
		out.println("alert('데이터베이스 오류입니다.')"); // 데이터베이스 오류
		out.println("history.back()");
		out.println("</script>");
	} else { // 로그인 실패
		out.println("<script>");
		out.println("alert('아이디 혹은 비밀번호를 다시 한 번 확인해주세요.')"); // 데이터베이스 오류
		out.println("history.back()");
		out.println("</script>");
	}
%>