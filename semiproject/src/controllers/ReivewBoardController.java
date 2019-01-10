package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import actions.Review_DeleteAction;
import actions.Review_FileDownLoadAction;
import actions.Review_ListAction;
import actions.Review_UpdateFormAction;
import actions.Review_UpdateProAction;
import actions.Review_ViewAction;
import actions.Review_WriteAction;

@WebServlet("/review/*")
public class ReivewBoardController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String action = uri.substring(uri.lastIndexOf("/"));

		String path = "";// forward 할 경로
		if (action.equals("/*") || action.equals("/list.do")) {
			Review_ListAction list = new Review_ListAction();
			list.execute(req, resp);
			path = "/Review_list.jsp";

		} else if (action.equals("/view.do")) {
			Review_ViewAction view = new Review_ViewAction();
			view.execute(req, resp);
			path = "/Review_view.jsp";

		} else if (action.equals("/writeForm.do")) { // 글쓰기 버튼누름(글쓰는 화면)
			path = "/Review_write.jsp";

		} else if (action.equals("/write.do")) { // 글 입력(insert), 제목글입력, 답변글입력 ()
			Review_WriteAction write = new Review_WriteAction();
			MultipartRequest multi = write.execute(req, resp); // 글이 저장됨

			// 리스트가 보여야함 ->페이지 이동이 있어야 함
			// forward방식이 아닌 sendRedirect방식을 사용해야 함
			// path = "/boardview/list.jsp";

			// 여기서 응답이 한번 되었으므로 아래는 응답이 되지 않도록 해주어야 한다. path = ""인 상태
			resp.sendRedirect("list.do?pageNum=" + multi.getParameter("pageNum"));
			// resp.sendRedirect("list.do)에서는 넘기는 값이 없으므로 답변을 썼을때 첫번째 페이지로 돌아가게 된다.
			// list.do를 호출할때 pageNum값을 넘겨야함 (그래야 답변을 쓰고 원래 있던 페이지로 돌아옴)
			// 여기에서는 req.~~ 하고 못받음, 첨부파일이 있기 때문에 -> 그렇다면 MultipartRequest를 생성해야 하는것인가?
			// -> WriteAction의 execute의 리턴타입이 MultipartRequest이므로 위에서 MultipartRequest
			// multi를 생성하여 값을 받아서 넘겨줄수있다.
		} else if (action.equals("/download.do")) {
			Review_FileDownLoadAction download = new Review_FileDownLoadAction();
			download.execute(req, resp);
		} else if (action.equals("/updateForm.do")) { // 수정 페이지로 이동
			Review_UpdateFormAction updateForm = new Review_UpdateFormAction();
			updateForm.execute(req, resp);
			path = "/Review_update.jsp";
		} else if (action.equals("/updatePro.do")) { // 수정하기
			Review_UpdateProAction updatePro = new Review_UpdateProAction();
			MultipartRequest multi = updatePro.execute(req, resp);
			resp.sendRedirect("list.do?pageNum=" + multi.getParameter("pageNum"));
		} else if (action.equals("/delete.do")) { // temp에 있는것도 삭제되는지 확인하자
			Review_DeleteAction write = new Review_DeleteAction();
			write.execute(req, resp);
			resp.sendRedirect("list.do?pageNum=" + req.getParameter("pageNum"));
		}

		if (path != "") {
			RequestDispatcher dis = req.getRequestDispatcher(path);
			dis.forward(req, resp);
		}

	}
}
