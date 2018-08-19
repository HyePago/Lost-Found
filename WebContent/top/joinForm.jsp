<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="top/joinProc.jsp" method="post">
		<table class="joinFormTable">
			<tr>
				<td><input type="text" name="username" placeholder="아이디" required></td>
			</tr>
			<tr>
				<td><input type="password" name="password" placeholder="비밀번호" required></td>
			</tr>
			<tr>
				<td><input type="text" name="name" placeholder="이름" required></td>
			</tr>
			<tr>
				<td><input type="text" name="nickname" placeholder="닉네임" required></td>
			</tr>
			<tr>
				<td>
					<select name="tel" required>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="017">017</option>
					</select>
					-
					<input type="text" name="tel1" class="tel" style="width: 100px" required>
					-
					<input type="text" name="tel2" class="tel" style="width: 100px" required>
				</td>
			</tr>
			<tr>
				<td style="text-align:center;"><input type="submit" value="가입하기" ></td>
			</tr>
		</table>
	</form>
</body>
</html>