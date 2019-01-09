package actions;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewBoardDAO;
import dto.PageDTO;

public class Review_ListAction extends HttpServlet {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String pageNum=req.getParameter("PageNum");
		if(pageNum==null || pageNum.equals("null")) {
			pageNum="1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		
		ReviewBoardDAO dao = ReviewBoardDAO.getInstance();
		
		int cnt = dao.rowTotalCount();
		if(cnt > 0) {
			PageDTO pdto = new PageDTO(currentPage, cnt);
			req.setAttribute("pdto", pdto);
			req.setAttribute("aList", dao.printList(pdto));
		}
				
	}
}
