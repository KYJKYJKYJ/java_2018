package reviewBoardDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import reviewBoardDTO.ReviewBoardDTO;
import reviewBoardpageDTO.ReviewboardPageDTO;

public class ReviewBoardDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	private static ReviewBoardDAO dao = new ReviewBoardDAO();
	
	public static ReviewBoardDAO getInstance() {
		return dao;
	}
	
	private Connection init() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.OracleDriver");
		String url = "jdbc:oracle:thin://@127.0.0.1:1521:xe";
		String username = "khgym";
		String password = "a1234";
		return DriverManager.getConnection(url, username, password);
	}
	
	private void exit() throws SQLException {
		if (rs != null)
			rs.close();
		if (stmt != null)
			stmt.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}
	
	// 게시글 목록 출력
	public List<ReviewBoardDTO> printList(ReviewboardPageDTO pdto) {
		List<ReviewBoardDTO> aList = new ArrayList<ReviewBoardDTO>();
		
		try {
			conn=init();
			String sql = "SELECT b.* FROM (SELECT rownum rm, a.* " + 
					"FROM (SELECT * FROM review ORDER by ref DESC, re_step)a)b " + 
					"WHERE rm >= ? and rm <= ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, pdto.getStartRow());
			pstmt.setInt(2, pdto.getEndRow());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ReviewBoardDTO dto = new ReviewBoardDTO();
				dto.setReview_num(rs.getInt("review_num"));
				dto.setReview_contents(rs.getString("review_contents"));
				dto.setReview_date(rs.getDate("review_date"));
				dto.setReview_title(rs.getString("review_title"));
				dto.setReview_upload(rs.getString("review_upload"));
				dto.setUserid(rs.getString("user_id"));
				aList.add(dto);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return aList;		
	}
	
	//게시글 조회
	public ReviewBoardDTO view(int num) {
		ReviewBoardDTO dto = null;
		
		try {
			conn = init();
			String sql = "SELECT * FROM review where review_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new ReviewBoardDTO();
				dto.setReview_num(rs.getInt("review_num"));
				dto.setReview_contents(rs.getString("review_contents"));
				dto.setReview_date(rs.getDate("review_date"));
				dto.setReview_title(rs.getString("review_title"));
				dto.setReview_upload(rs.getString("review_upload"));
				dto.setUserid(rs.getString("user_id"));
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return dto;			
	}
	
	public void insert(ReviewBoardDTO dto) {
		try {
			conn = init();
			String sql = "insert into review(review_num, user_id, ) values(review_num.nextval, ?, ?)";
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
