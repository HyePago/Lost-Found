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
				<th style="width: 130px;">�з�</th>
				<td>
					<select name="division" required>
						<option value="����">����</option>
						<option value="��⵵">��⵵</option>
						<option value="��õ">��õ</option>
						<option value="������">������</option>
						<option value="��û�ϵ�">��û�ϵ�</option>
						<option value="��û����">��û����</option>
						<option value="����">����</option>
						<option value="���ϵ�">���ϵ�</option>
						<option value="��󳲵�">��󳲵�</option>
						<option value="�뱸">�뱸</option>
						<option value="���">���</option>
						<option value="�λ�">�λ�</option>
						<option value="����ϵ�">����ϵ�</option>
						<option value="���󳲵�">���󳲵�</option>
						<option value="����">����</option>
						<option value="���ֵ�">���ֵ�</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>���� ��ġ</th>
				<td><input type="text" name="area" required></td>
			</tr>
			<tr>
				<th>����</th>
				<td><input type="text" name="title" required></td>
			</tr>
			<tr>
				<th>����</th>
				<td><textarea rows="5" cols="20" name="content" required></textarea>
			</tr>
			<tr>
				<th>��ȣ ���� ����</th>
				<td><input type="checkbox" name="phone" id="phone"><label for="phone"></label></td>
			</tr>
			<tr>
				<th>���� ÷��</th>
				<td><input type="file" name="picture" id="picture"><label for="picture" class="pictureLabel">���� ����</label></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;"><input type="submit" value="�ۼ��ϱ�"></td>
			</tr>
		</table>
	</form>
</body>
</html>