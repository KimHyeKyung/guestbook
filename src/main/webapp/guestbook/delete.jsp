<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="guestbook.GuestbookDao"%>
<%@ page import="guestbook.GusetbookDaoImpl"%>
<%@ page import="guestbook.GuestbookVo"%>

<%
request.setCharacterEncoding("UTF-8");
String no = request.getParameter("no");
String password = request.getParameter("password");

GuestbookVo vo = new GuestbookVo();
vo.setNo(Integer.parseInt(no));
vo.setPassword(password);

GuestbookDao dao = new GusetbookDaoImpl();

if (dao.delete(vo) > 0) {
	response.sendRedirect("list.jsp");
} else {
%>
<script type="text/javascript">
	alert("데이터 삭제 실패");
	history.go(-1);
</script>

<%
}
%>

