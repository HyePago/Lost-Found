<%@page import="post.Post"%>
<%@page import="post.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		String time = request.getParameter("time");
	
		PostDAO postDAO = new PostDAO();
		Post post = postDAO.showPost(id);
	%>
	<table class="postFormTable" width="780px">
		<tr>
			<td class="tableLogo" colspan="3"><%= post.getTitle() %><hr color="#2478FF" height="2px"></td>
		</tr>
		<tr>
			<td><%= post.getArea() %></td>
		</tr>
		<tr>
			<td>
				<span><%= post.getNickname() %></span> &nbsp;&nbsp;&nbsp;&nbsp;<span><%= time %></span>
			</td>
		</tr>
		<%
			if(!(post.getPicture() == null || post.getPicture().equals(""))) {
				%>
					<tr>
						<td>
							<img src="<%= post.getPicture() %>">
						</td>
					</tr>
				<%
			}
		%>
		<tr>
			<td>
				<%= post.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>
			</td>
		</tr>
		
	</table>
</body>
</html>