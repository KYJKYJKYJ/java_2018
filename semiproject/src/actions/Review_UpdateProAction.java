package actions;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ReviewBoardDAO;
import dto.ReviewBoardDTO;


public class Review_UpdateProAction {
	public MultipartRequest execute(HttpServletRequest req, HttpServletResponse resp) {
		MultipartRequest multi = null;
		String saveDirectory = "c:/temp";
		File file = new File(saveDirectory);
		if(!file.exists())
			file.mkdir();
		
		int maxPostSize = 10000000; //10mb
		String encoding = "UTF-8";
		try {
			multi = new MultipartRequest(req, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());				
				
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		ReviewBoardDTO dto = new ReviewBoardDTO();
		ReviewBoardDAO dao = ReviewBoardDAO.getInstance();
		int num = Integer.parseInt(multi.getParameter("num"));
		
		//board 테이블에 첨부파일의 저장여부 검색
		String filename = dao.file(num);
		
		//수정 첨부파일이 있으면
		if(multi.getFilesystemName("review_upload") != null) {
			//기존 첨부파일이 있으면
			if(filename != null) {
				File oldFile = new File(saveDirectory, filename);
				oldFile.delete();
			}
			
			dto.setReview_upload(multi.getFilesystemName("review_upload"));
		} else {
			//수정 첨부파일이 없으면
			if(filename != null) {
				dto.setReview_upload(filename);
			}
		}
		
		dto.setReview_title(multi.getParameter("review_title"));
		dto.setReview_contents(multi.getParameter("review_contents"));
		dto.setReview_num(Integer.parseInt(multi.getParameter("num")));

		dao.update(dto);
		
		return multi;
	}
}
