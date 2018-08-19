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
		
		// division: String 변환
		String division = null;
		
		switch(request_division) {
		case 1:
			division = "서울";
			break;
		case 2:
			division = "경기";
			break;
		case 3:
			division = "인천";
			break;
		case 4:
			division = "강원도";
			break;
		case 5:
			division = "충청북도";
			break;
		case 6:
			division = "충청남도";
			break;
		case 7:
			division = "대전";
			break;
		case 8:
			division = "경상북도";
			break;
		case 9:
			division = "경상남도";
			break;
		case 10:
			division = "대구";
			break;
		case 11:
			division = "울산";
			break;
		case 12:
			division = "부산";
			break;
		case 13:
			division = "전라북도";
			break;
		case 14:
			division = "전라남도";
			break;
		case 15:
			division = "광주";
			break;
		case 16:
			division = "제주도";
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
						<option value="1">위치</option>
						<option value="2">제목</option>
						<option value="3">내용</option>
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
			<th width="130px">날짜</th>
			<th width="250px">지역</th>
			<th width="400px">제목</th>
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
				<a class="pageConnect" href="post.jsp?division=<%= request_division %>&page=<%= currentPage - 10 %>">◀ 이전 </a>&nbsp;&nbsp;
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
				&nbsp;<a class="pageConnect" href="post.jsp?division=<%= request_division %>&page=<%= currentPage + 10 %>">다음 ▶</a>
			</td>
		</tr>
	</table>
</body>
</html>