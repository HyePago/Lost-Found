<%@page import="java.net.URLEncoder"%>
<%@page import="post.Posts"%>
<%@page import="java.util.ArrayList"%>
<%@page import="post.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("EUC-KR");
	
		// request
		String select = request.getParameter("select");
		String searchText = request.getParameter("searchText");
		
		out.println(select);
		out.println(searchText);
		
		PostDAO postDAO = new PostDAO();
	
		int request_division = Integer.parseInt(request.getParameter("division"));
		
		// division: String ��ȯ
		String division = null;
		
		switch(request_division) {
		case 1:
			division = "����";
			break;
		case 2:
			division = "���";
			break;
		case 3:
			division = "��õ";
			break;
		case 4:
			division = "������";
			break;
		case 5:
			division = "��û�ϵ�";
			break;
		case 6:
			division = "��û����";
			break;
		case 7:
			division = "����";
			break;
		case 8:
			division = "���ϵ�";
			break;
		case 9:
			division = "��󳲵�";
			break;
		case 10:
			division = "�뱸";
			break;
		case 11:
			division = "���";
			break;
		case 12:
			division = "�λ�";
			break;
		case 13:
			division = "����ϵ�";
			break;
		case 14:
			division = "���󳲵�";
			break;
		case 15:
			division = "����";
			break;
		case 16:
			division = "���ֵ�";
			break;
		}
		
		// page
		int requestPage = Integer.parseInt(request.getParameter("page"));
		int maxPage = postDAO.searchMaxPage(division, select, searchText);
		int currentPage = requestPage;
		
		if(requestPage < 1) {
			currentPage = 1;
		} else if(requestPage > maxPage) {
			currentPage = maxPage;
		}
		
		// post
		ArrayList<Posts> posts = postDAO.searchGetPosts(currentPage, division, select, searchText);
	%>
	<form action="postSearch.jsp" method="post">
		<table class="postFormTable" width="780px" style="text-align: center;">
			<tr>
				<td>
					<select name="select">
						<option value="1">��ġ</option>
						<option value="2">����</option>
						<option value="3">����</option>
					</select>
					<input type="text" name="searchText" required>
					<input type="hidden" name="division" value="<%= request_division %>">
					<input type="hidden" name="page" value="1">
					<input type="submit" name="submit" id="submit"></input><label for="submit"><img src="images/magnifier.png" style="width: 25px; height: 25px; margin-bottom: -6px;"></label>	
				</td>
			</tr>
		</table>
	</form>
	<table class="postFormTable" width="780px">
		<tr>
			<td class="tableLogo" colspan="3"><%= division %><hr color="#2478FF" height="2px"></td>
		</tr>	
		<tr>
			<th width="130px">��¥</th>
			<th width="250px">����</th>
			<th width="400px">����</th>
		</tr>
		<%
			for(int i=0; i<posts.size(); i++){
				Posts post = posts.get(i);
				%>
				<tr>
					<td><%= post.getTime() %></td>
					<td><%= post.getArea() %></td>
					<td><a href="../postView.jsp?id=<%= post.getId() %>" class="postTitle"><%= post.getTitle() %></a></td>
				</tr>
				<tr>
					<td colspan="3"><hr color="#2478FF" size=1></td>
				</tr>	
				<%
			}
		%>
		<tr>
			<td colspan="3" style="text-align: center;">
				<a class="pageConnect" href="post.jsp?division=<%= request_division %>&page=<%= currentPage - 10 %>">�� ���� </a>&nbsp;&nbsp;
				<%
					int startPage = currentPage / 10 * 10 + 1;
					int endPage = startPage + 9;
					
					if(endPage > maxPage) {
						endPage = maxPage;
					}
					
					for(int i=startPage; i<=endPage; i++) {
						if(i == currentPage) {
							%>
							<a class="pageConnect" style="font-weight: bold; color: #2478FF;" href="post.jsp?division=<%= request_division %>&page=<%= i %>"><%= i %></a>&nbsp;&nbsp;
							<%
						} else {
							%>
								<a class="pageConnect" href="post.jsp?division=<%= request_division %>&page=<%= i %>"><%= i %></a>&nbsp;&nbsp;
							<%
						}
					}
				%>
				&nbsp;<a class="pageConnect" href="post.jsp?division=<%= request_division %>&page=<%= currentPage + 10 %>">���� ��</a>
			</td>
		</tr>
	</table>
</body>
</html>