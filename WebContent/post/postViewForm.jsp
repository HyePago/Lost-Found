<%@page import="comment.CommentDAO"%>
<%@page import="comment.Comment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="user.UserDAO"%>
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
	<table class="postFormTable" width="780px" style="font-size: 0.9em;">
		<tr>
			<td class="tableLogo" colspan="3" style="font-size: 1.8em"><%= post.getTitle() %><hr color="#2478FF" height="2px"></td>
		</tr>
		<tr>
			<td><b>위치 &nbsp;&nbsp;| </b><%= post.getArea() %></td>
		</tr>
		<tr>
			<td>
				<span><b>닉네임 | </b><%= post.getNickname() %></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span><b>시간 | </b><%= time %></span>
			</td>
		</tr>
		<%
			if(post.getPhone() == 1) {
				UserDAO userDAO = new UserDAO();
				%>
				<tr>
					<td>
						<b>연락처 | </b><%= userDAO.getPhone(post.getNickname()) %>
					</td>
				</tr>
				<%
			}
		%>
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
		<tr>
			<% 
				if(post.getNickname().equals((String)session.getAttribute("nickname"))) { %>
				<td colspan="2" style="text-align: right"><a href="deletePost.jsp?id=<%= id %>&time=<%= time %>" class="pageConnect">삭제</a></td>
			<% } %>
		</tr>
		<tr>
			<td><hr color="#2478FF" height="2px"></td>
		</tr>
		<tr>
			<td>
				<table width="780px">
					<tr>
						<td colspan="2">댓글<hr color="gray" height="1px"></td>
					</tr>
					<tr>
						<td colspan="3">
							<% 
								if(((String)session.getAttribute("username")) == null || ((String)session.getAttribute("username")).equals("")) { } else {%>
								<form action="comment.jsp" method="post">
									<table width="780px">
										<tr>
											<td>	
												<textarea rows="3" cols="20" name="commentText"></textarea>
											</td>
											<td>
												<input type="submit" value="입력" id="postSend">
												<input type="hidden" value="<%= id %>" name="id">
											</td>
										</tr>
									</table>
								</form>
							<%
								}
							%>
						</td>
					</tr>
					<%
						CommentDAO commentDAO = new CommentDAO();
						ArrayList<Comment> comments = commentDAO.getComments(id);
					
						for(int i=0; i<comments.size(); i++) {
							Comment comment = comments.get(i);
							%>
							<tr>
								<td width="100px">
									<b><%= comment.getNickname() %></b>
								</td>
								<td>
									<%= comment.getComment().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>
								</td>
								<% 
								if(comment.getNickname().equals((String)session.getAttribute("nickname"))) { %>
									<th width="30px;">
										<a href="commentDelete.jsp?id=<%= comment.getId() %>&parentid=<%= id %>&time=<%= time %>">삭제</a>
									</th>
								<% } else { %>
									<th width="30px;">
									</th>
								<% } %>
							</tr>
							<tr>
								<td colspan="3"><hr color="gray" size=1></td>
							</tr>
							<%
						}
					%>
					<tr>
						<td></td>
					</tr>
					<tr>
						<td></td>
					</tr>
					<tr>
						<td></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>