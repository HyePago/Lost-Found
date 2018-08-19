<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="css/myStyle.css" rel="stylesheet">
</head>
<body class="topBody">
	<header class="mainHeader">
		<nav>
			<a href="index.jsp"><div class="logo">Lost & Found</div></a>
			<ul class="topUl">
				<% 
					if(((String)session.getAttribute("username")) == null || ((String)session.getAttribute("username")).equals("")) { %>
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
				<%	} else { %>
						<li><a href="write.jsp">글 작성</a></li>
						<li><a href="top/logout.jsp">로그아웃</a></li>
				<% } %>
			</ul>
		</nav>
	</header>
</body>
</html>