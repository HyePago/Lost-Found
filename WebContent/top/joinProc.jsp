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
	
	// ȸ������
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(user);
	
	if(result == -2) {
		out.println("<script>");
		out.println("alert('�̹� �����ϴ� ���̵��Դϴ�.')"); // �����ͺ��̽� ����
		out.println("history.back()");
		out.println("</script>");
	} else if(result == -3) {
		out.println("<script>");
		out.println("alert('�̹� �����ϴ� �г����Դϴ�.')"); // �����ͺ��̽� ����
		out.println("history.back()");
		out.println("</script>");
	} else if(result == -1) {
		out.println("<script>");
		out.println("alert('�����ͺ��̽� �����Դϴ�.')"); // �����ͺ��̽� ����
		out.println("history.back()");
		out.println("</script>");
	} else {
		// ȸ������ ����
		out.println("<script>");
		out.println("location.href = '../login.jsp'");
		out.println("</script>");
	}
%>