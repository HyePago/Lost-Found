<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="username" />
<jsp:setProperty name="user" property="password" />

<%	
	// �α���
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(user.getUsername(), user.getPassword());
	
	if(result == 1) { // �α��� ����
		// ȸ������ ����
		session.setAttribute("username", user.getUsername());
		String nickname = userDAO.getNickname(user.getUsername());
		session.setAttribute("nickname", nickname);
		out.println("<script>");
		out.println("location.href = '../index.jsp'");
		out.println("</script>");
	} else if(result == -2) { // �����ͺ��̽� ����
		out.println("<script>");
		out.println("alert('�����ͺ��̽� �����Դϴ�.')"); // �����ͺ��̽� ����
		out.println("history.back()");
		out.println("</script>");
	} else { // �α��� ����
		out.println("<script>");
		out.println("alert('���̵� Ȥ�� ��й�ȣ�� �ٽ� �� �� Ȯ�����ּ���.')"); // �����ͺ��̽� ����
		out.println("history.back()");
		out.println("</script>");
	}
%>