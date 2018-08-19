<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Lost</title>
<link href="css/myStyle.css" rel="stylesheet">
</head>
<body class="mainBody">
<%
	String ContentPage = request.getParameter("CONTENTPAGE");
%>
	<header class="mainHeader">
		<jsp:include page="top.jsp" />
	</header>
	
	<section width="1200px" id="mainSection">
		<jsp:include page="<%= ContentPage %>" flush="false" />
	</section>
</body>
</html>