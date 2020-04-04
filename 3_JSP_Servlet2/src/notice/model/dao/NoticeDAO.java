package notice.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import notice.model.vo.Notice;

public class NoticeDAO {
	
	private Properties prop = new Properties();
	
	public NoticeDAO() {
		String fileName = NoticeDAO.class.getResource("/sql/notice/notice-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Notice> selectList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		
		ArrayList<Notice> list = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Notice>();
			
			while(rset.next()) {
				Notice no = new Notice(rset.getInt("nno"),
										rset.getString("ntitle"),
										rset.getString("ncontent"),
										rset.getString("nwriter"),
										rset.getInt("ncount"),
										rset.getDate("nDate"));
				
				list.add(no);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
			
		
		return list;
	}

	public int insertNotice(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, n.getnTitle());
			pstmt.setString(2, n.getnContent());
			pstmt.setString(3, n.getnWriter());
			pstmt.setDate(4, n.getnDate());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateCount(Connection conn, int no) {
		// 쿼리를 먼저 써보자..
		// update notice set ncount = ncount + 1 where nno = ?
		// 위치홀더가 들어갔으니 ==> PreparedStatement
		// update를 썼으니 ==> int result
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public Notice selectNotice(Connection conn, int no) {
		// 쿼리부터 써보기
		// select * from notice where nno = ?
		// 위치홀더가 있으니 ==> PreparedStatement pstmt
		// select문이니 ==> ResultSet rset
		// select한 결과는 0~1개! 그리고 결과 값은 notice니까 ==> Notice n
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice n = null;
		
		String query = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			
			if(rset.next()) { // 한 개 아니면 영 개이기 때문에 while문을 돌릴 필요 없음
				n = new Notice(rset.getInt("nno"), 
							   rset.getString("ntitle"),
							   rset.getString("ncontent"),
							   rset.getString("nwriter"),
							   rset.getInt("ncount"), 
							   rset.getDate("ndate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
	}

	public int updateNotice(Connection conn, Notice n) {
		// 쿼리부터 작성해보기
		// update notice set ntitle=?, ncontent=?, ndate=? where nno=?
		// 위치홀더가 있으니 PreparedStatement
		// update니까 int result
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, n.getnTitle());
			pstmt.setString(2, n.getnContent());
			pstmt.setDate(3, n.getnDate());
			pstmt.setInt(4, n.getnNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteNotice(Connection conn, int nno) {
		//  쿼리 : update notice set status='N' where nno = ?
		// 위치홀더가 있으니 PreparedStatement
		// update니까 int result
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, nno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
