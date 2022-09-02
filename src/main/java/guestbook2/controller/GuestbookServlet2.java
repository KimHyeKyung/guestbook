package guestbook2.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guestbook2.dao.GuestbookDao;
import guestbook2.dao.GusetbookDaoImpl;
import guestbook2.vo.GuestbookVo;

@WebServlet(description = "방명록 서블릿", urlPatterns = { "/guestbook2" })
public class GuestbookServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GuestbookServlet2() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GuestbookServlet2.java.doGet() 호출");
		request.setCharacterEncoding("utf-8");

		String actionName = request.getParameter("a");
		if ("deleteform".equals(actionName)) {
			System.out.println("actionName => " + actionName);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/guestbook2/deleteform.jsp");
			rd.forward(request, response);
		} else if ("add".equals(actionName)) {
			System.out.println("actionName => " + actionName);
			request.setCharacterEncoding("UTF-8");
			String name = request.getParameter("name");
			String password = request.getParameter("pass");
			String content = request.getParameter("content");

			GuestbookVo vo = new GuestbookVo(name, password, content);

			GuestbookDao dao = new GusetbookDaoImpl();
			dao.insert(vo);

			response.sendRedirect("/guestbook/guestbook2");
		} else if ("delete".equals(actionName)) {
			System.out.println("actionName => " + actionName);
			request.setCharacterEncoding("utf-8");

			String no = request.getParameter("no");
			String password = request.getParameter("password");

			GuestbookVo vo = new GuestbookVo();
			vo.setNo(Integer.parseInt(no));
			vo.setPassword(password);
			
			GuestbookDao dao = new GusetbookDaoImpl();
			int count = dao.delete(vo);
			if(count > 0){
				response.sendRedirect("/guestbook/guestbook2");
			}else{
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/guestbook2/deleteError.jsp");
				rd.forward(request, response);
			}
		} else {
			System.out.println("actionName => " + actionName);
			GuestbookDao dao = new GusetbookDaoImpl();
			List<GuestbookVo> list = dao.getList();

			request.setAttribute("list", list);

			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/guestbook2/index.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}