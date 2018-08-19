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
						<li><a href="login.jsp">�α���</a></li>
						<li><a href="join.jsp">ȸ������</a></li>
				<%	} else { %>
						<li><a href="write.jsp">�� �ۼ�</a></li>
						<li><a href="top/logout.jsp">�α׾ƿ�</a></li>
				<% } %>
			</ul>
		</nav>
	</header>
</body>
</html>