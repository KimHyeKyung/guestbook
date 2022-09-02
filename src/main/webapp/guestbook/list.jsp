<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="guestbook.GuestbookDao"%>
<%@ page import="guestbook.GusetbookDaoImpl"%>
<%@ page import="guestbook.GuestbookVo"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<style>
	#wrap{
		width: 500px;
    	margin: 0 auto;
	}
</style>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>
	<div id="wrap">
		<form action="add.jsp" method="post">
	<table style="width: 100%">
		<tr>
			<td>이름</td>
			<td><input type="text" name="name"width="100%"></td>
			<td>비밀번호</td>
			<td><input type="password" name="pass"width="100%"></td>
		</tr>
		<tr>
			<td colspan=4>
				<textarea name="content" cols=60 rows=5 style="width: 100%"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan=4 align=right><input type="submit" VALUE="확인"></td>
		</tr>
	</table>
	</form>
	<br/>

	<!-- 방명록 리스트 -->
	<%-- list에서 하나씩 빼서 테이블를 채운다--%>
	<%
	GuestbookDao dao = new GusetbookDaoImpl();
	List<GuestbookVo> list = dao.getList();      
      for(GuestbookVo vo : list) {
  	%>
	<table width="100%" border=1>
		<tr>
			<td style="text-align: center;">[<%=vo.getNo()%>]</td>
			<td  width="200px"><%=vo.getName()%></td>
			<td><%=vo.getReg_date()%></td>
			<td width="50"><a href="deleteform.jsp?no=<%=vo.getNo()%>" style="text-decoration : none; color: gray;">삭제</a></td>
		</tr>
		<tr>
			<td colspan=4 style="padding: 15px 10px"><%=vo.getContent()%></td>
		</tr>
	</table>
	</br>
  <%
  }
  %>
	
	</div>
	

</body>
</html>