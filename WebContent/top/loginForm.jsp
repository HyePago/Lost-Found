<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="top/loginProc.jsp" method="post">
		<table class="joinFormTable">
			<tr>
				<td><input type="text" name="username" placeholder="아이디" required></td>
			</tr>
			<tr>
				<td><input type="password" name="password" placeholder="비밀번호" required></td>
			</tr>
			<tr>
				<td style="text-align:center;"><input type="submit" value="로그인" ></td>
			</tr>
		</table>
	</form>
</body>
</html>