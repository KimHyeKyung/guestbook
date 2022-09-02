<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="guestbook.GuestbookVo"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>

<% 
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	
	GuestbookVo vo = new GuestbookVo();
  	vo.setNo(Integer.parseInt(no));
  	
%>
	<form action="delete.jsp" method="post">
		<input type="hidden" name="no" value="<%=vo.getNo()%>">
		<table>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password"></td>
				<td><input type="submit" value="확인"></td>
				<td><a href="list.jsp">메인으로 돌아가기</a></td>
			</tr>
		</table>
	</form>
</body>
</html>