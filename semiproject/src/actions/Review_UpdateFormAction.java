package actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewBoardDAO;
import dto.ReviewBoardDTO;

public class Review_UpdateFormAction {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		int num = Integer.parseInt(req.getParameter("num"));
		ReviewBoardDAO dao = ReviewBoardDAO.getInstance();
		ReviewBoardDTO dto = dao.view(num);
		
		req.setAttribute("dto", dto);
	}
}
