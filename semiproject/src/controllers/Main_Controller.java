package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import actions.MemberJoinAction;

@WebServlet("/home/*")
public class Main_Controller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}// end doGet()////////////////////////////

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);

	}// end doPost()//////////////////////////

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String uri = req.getRequestURI();
		// System.out.println(uri);
		String action = uri.substring(uri.lastIndexOf("/"));
		// System.out.println(action);
		String path = "";

		if (action.equals("/*") || action.equals("/main.do")) {
			path = "/main.jsp";
		} else if (action.equals("/greeting.do")) {
			path = "/greeting.jsp";
		} else if (action.equals("/instructor.do")) {
			path = "/instructor.jsp";
		} else if (action.equals("/loungeview.do")) {
			path = "/loungeview.jsp";
		} else if (action.equals("/location.do")) {
			path = "/location.jsp";
		} else if (action.equals("/aboutprogram.do")) {
			path = "/aboutprogram.jsp";
		} else if (action.equals("/registration.do")) {
			path = "/registration.jsp";
		} else if (action.equals("/notice.do")) {
			path = "/notice.jsp";
		} else if (action.equals("/qna.do")) {
			path = "/qna.jsp";
		} else if (action.equals("/review.do")) {
			path = "/review.jsp";
		} else if (action.equals("/information.do")) {
			path = "/information.jsp";
		} else if (action.equals("/login.do")) {
			path = "/login.jsp";
		} else if (action.equals("/mypage.do")) {
			path = "/mypage.jsp";
		} else if (action.equals("/Mem.do")) {
			System.out.println("1");
			MemberJoinAction join = new MemberJoinAction();
			join.execute(req, resp);
			System.out.println("회원가입성공");
		}

		if (path != "") {
			RequestDispatcher dis = req.getRequestDispatcher(path);
			dis.forward(req, resp);
		}

	}// end doProcess()/////////////////////////
}// end class