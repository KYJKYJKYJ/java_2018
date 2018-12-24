package boarddemo.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import boarddemo.dao.BoardDAO;
import boraddemo.dto.BoardDTO;

public class UpdateProAction {
	public MultipartRequest execute(HttpServletRequest req, HttpServletResponse resp) {
		MultipartRequest multi = null;
		String saveDirectory = "c:/temp";
		File file = new File(saveDirectory);
		if(!file.exists())
			file.mkdir();
		
		int maxPostSize = 1000000000; //1gb
		String encoding = "UTF-8";
		try {
			multi = new MultipartRequest(req, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());				
				
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		BoardDTO dto = new BoardDTO();
		BoardDAO dao = BoardDAO.getInstance();
		int num = Integer.parseInt(multi.getParameter("num"));
		
		//board 테이블에 첨부파일의 저장여부 검색
		String filename = dao.fileMethod(num);
		
		//수정 첨부파일이 있으면
		if(multi.getFilesystemName("upload") != null) {
			//기존 첨부파일이 있으면
			if(filename != null) {
				File oldFile = new File(saveDirectory, filename);
				//board 테이블에 첨부파일을 삭제함
				oldFile.delete();
			}
			
			dto.setUpload(multi.getFilesystemName("upload"));
		} else {
			//수정 첨부파일이 없으면
			if(filename != null) {
				dto.setUpload(filename);
			}
		}
		
		dto.setEmail(multi.getParameter("email"));
		dto.setSubject(multi.getParameter("subject"));
		dto.setContent(multi.getParameter("content"));
		dto.setNum(Integer.parseInt(multi.getParameter("num")));
		dao.updateMethod(dto);
		
		return multi;
	}
}
