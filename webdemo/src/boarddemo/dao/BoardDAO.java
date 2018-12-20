package boarddemo.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import boraddemo.dto.BoardDTO;

public class BoardDAO {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private static BoardDAO dao = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return dao;
	}
	
	private Connection init() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.OracleDriver");
		String url = "jdbc:oracle:thin://@127.0.0.1:1521:xe";
		String username = "hr";
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
	
	public List<BoardDTO> listMethod() {
		List<BoardDTO> aList = new ArrayList<BoardDTO>();
		
		try {
			conn=init();
			String sql = "select * from board order by ref desc";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setRe_level(rs.getInt("re_level"));
				dto.setUpload(rs.getString("upload"));
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
	
	public void readCountMethod(int num) { // 조회수
		try {
			conn=init();
			String sql="update board set readcount = readcount+1 where num=?";
			pstmt=conn.prepareStatement(sql);
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
	
	// num에 해당하는 단일 레코드에 대한 정보를 담아서 가져올 때는 그냥 DTO 하나만.. (여러개의 레코드에서 받아와야 한다면 List 써야하는게 맞다)
	public BoardDTO viewMethod(int num) {
		BoardDTO dto = null;
		
		try {
			conn=init();
			String sql="select * from board where num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			//pstmt.executeUpdate();
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
	            dto=new BoardDTO();
	            dto.setNum(rs.getInt("num"));
	            dto.setWriter(rs.getString("writer"));
	            dto.setReadcount(rs.getInt("readcount"));
	            dto.setSubject(rs.getString("subject"));
	            dto.setEmail(rs.getString("email"));
	            dto.setContent(rs.getString("content"));
	            dto.setUpload(rs.getString("upload"));
	            dto.setRef(rs.getInt("ref"));
	            dto.setRe_step(rs.getInt("re_step"));
	            dto.setRe_level(rs.getInt("re_level"));
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
	
	public void insertMethod(BoardDTO dto) {
		try {
			conn=init();
			String sql="insert into board(num,writer,email,subject,reg_date,ref,re_step,re_level,content,ip,upload) " +
					   "values(board_num_seq.nextval,?,?,?,sysdate,board_num_seq.nextval,0,0,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getIp());
			pstmt.setString(6, dto.getUpload());
			
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
}
