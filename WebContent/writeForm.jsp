<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="post/writeProc.jsp" method="post" enctype="multipart/form-data" >
		<table class="writeFormTable">
			<tr>
				<th style="width: 130px;">분류</th>
				<td>
					<select name="division" required>
						<option value="서울">서울</option>
						<option value="경기도">경기도</option>
						<option value="인천">인천</option>
						<option value="강원도">강원도</option>
						<option value="충청북도">충청북도</option>
						<option value="충청남도">충청남도</option>
						<option value="대전">대전</option>
						<option value="경상북도">경상북도</option>
						<option value="경상남도">경상남도</option>
						<option value="대구">대구</option>
						<option value="울산">울산</option>
						<option value="부산">부산</option>
						<option value="전라북도">전라북도</option>
						<option value="전라남도">전라남도</option>
						<option value="광주">광주</option>
						<option value="제주도">제주도</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>상세한 위치</th>
				<td><input type="text" name="area" required></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" required></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="5" cols="20" name="content" required></textarea>
			</tr>
			<tr>
				<th>번호 공개 여부</th>
				<td><input type="checkbox" name="phone" id="phone"><label for="phone"></label></td>
			</tr>
			<tr>
				<th>파일 첨부</th>
				<td><input type="file" name="picture" id="picture"><label for="picture" class="pictureLabel">파일 선택</label></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;"><input type="submit" value="작성하기"></td>
			</tr>
		</table>
	</form>
</body>
</html>