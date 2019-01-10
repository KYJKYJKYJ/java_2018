package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dto.ReviewBoardDTO;
import dto.ReviewReplyDTO;
import dto.PageDTO;

public class ReviewBoardDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	public ReviewBoardDAO() {
		
	}
	
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
	
	public int rowTotalCount() {
		int cnt = 0;
		
		try {
			conn = init();
			String sql = "select count(*) from review";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next())
				cnt=rs.getInt(1);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return cnt;
	}
	
	// 게시글 목록 출력
	public List<ReviewBoardDTO> printList(PageDTO pdto) {
		List<ReviewBoardDTO> aList = new ArrayList<ReviewBoardDTO>();
		
		try {
			conn=init();
			String sql = "SELECT b.* FROM (SELECT rownum rm, a.* " + 
					"FROM (SELECT * FROM review ORDER by review_ref DESC)a)b " + 
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
				dto.setUser_id(rs.getString("user_id"));
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
				dto.setReview_ref(rs.getInt("review_ref"));
				dto.setReview_title(rs.getString("review_title"));
				dto.setReview_upload(rs.getString("review_upload"));
				dto.setUser_id(rs.getString("user_id"));
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
	
	//게시글 입력
	public void insert(ReviewBoardDTO dto) {
		try {
			conn = init();
			String sql = "insert into review(review_num, user_id, review_date, review_ref, review_title, review_contents, review_upload) " +
					     "values(review_num.nextval, ?, sysdate, review_num.nextval, ?, ?, ?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getReview_title());
			pstmt.setString(3, dto.getReview_contents());
			pstmt.setString(4, dto.getReview_upload());		
			pstmt.executeUpdate();			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	//첨부파일
	public String file(int num) {
		String fileStr = "";
		try {
			conn = init();
			String sql = "select review_upload from review where review_num = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();			
			
			if(rs.next())
				fileStr=rs.getString("review_upload");			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
				
		return fileStr;
	}
	
	//게시글 수정
	public void update(ReviewBoardDTO dto) {
		try {
			conn = init();
			String sql = "update review set review_title = ?, ";
			sql += "review_contents = ?, review_upload = ? where review_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getReview_title());
			pstmt.setString(2, dto.getReview_contents());
			pstmt.setString(3, dto.getReview_upload());
			pstmt.setInt(4, dto.getReview_num());
			pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	//게시글 삭제
	public void delete(int num) {
		try {
			conn = init();
			String sql = "delete from review where review_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	//댓글 리스트 불러오기
	public List<ReviewReplyDTO> getCommList(int num) {
		List<ReviewReplyDTO> list = new ArrayList<ReviewReplyDTO>();
		
		try {
			conn = init();
			String sql = "select * from review_reply where reivew_num=? "
						 + "order by re_col";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewReplyDTO dto = new ReviewReplyDTO();
				dto.setRe_col(rs.getInt("re_col"));
				dto.setReview_num(rs.getInt("review_num"));
				dto.setRe_content(rs.getString("re_content"));
				list.add(dto);
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
		
		return list;
	}

	public void commInsert(ReviewReplyDTO dto) {
		 try {
			conn = init();
			String sql = "insert into comm values(re_col.nextval, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getReview_num());
			pstmt.setString(2, dto.getRe_content());
			pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	public void commUpdate(ReviewReplyDTO dto) {
		try {
			conn = init();
			String sql = "update reply set re_content = ? where re_col = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getRe_content());
			pstmt.setInt(2, dto.getRe_col());
			pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
	}
	
	public void commDelete(int col) {
		try {
			conn = init();
			String sql = "delete from reply where re_col=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, col);
			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
