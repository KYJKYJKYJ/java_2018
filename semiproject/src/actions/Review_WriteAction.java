package actions;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ReviewBoardDAO;
import dto.ReviewBoardDTO;

public class Review_WriteAction {
	public MultipartRequest execute(HttpServletRequest req, HttpServletResponse resp) {
		MultipartRequest multi = null;
		String path = req.getServletContext().getRealPath("/");
		// 이 경로에 파일을 저장하게 하는것이 서로 동일하게 작업할수 있게함, 직접적인 폴더 경로 설정해서 하는 것은 적절하지 않음
		System.out.println("path : " + path);
		String saveDirectory = path + "/temp";

		File file = new File(saveDirectory);
		if (!file.exists())
			file.mkdir();

		int maxPostSize = 1000000000; // 1gb
		String encoding = "UTF-8";
		try {
			multi = new MultipartRequest(req, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());

		} catch (IOException e) {
			e.printStackTrace();
		}

		ReviewBoardDAO dao = ReviewBoardDAO.getInstance();
		ReviewBoardDTO dto = new ReviewBoardDTO();

		dto.setUser_id(multi.getParameter("user_id"));
		dto.setReview_title(multi.getParameter("review_title"));
		dto.setReview_contents(multi.getParameter("review_contents"));
		dto.setReview_upload(multi.getFilesystemName("review_upload")); // 첨부파일만 getFileSystemName
		
		dao.insert(dto);
		return multi;
	}
}
