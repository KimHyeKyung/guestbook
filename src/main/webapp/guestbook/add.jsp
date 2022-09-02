<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="guestbook.GuestbookDao"%>
<%@ page import="guestbook.GusetbookDaoImpl"%>
<%@ page import="guestbook.GuestbookVo"%>

<% 
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String password = request.getParameter("pass");
	String content = request.getParameter("content");
	
	GuestbookVo vo = new GuestbookVo(name, password, content);
	
	GuestbookDao dao = new GusetbookDaoImpl();
	if(dao.insert(vo) > 0){
	  response.sendRedirect("list.jsp");  
  }else{
%>
<script type="text/javascript">
  alert("데이터 입력 실패");
  history.go(-1);
</script>

<%    
  }
%>
