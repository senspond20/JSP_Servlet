package notice.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
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
	
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		String query = prop.getProperty("selectList");
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
		
			while(rs.next() == true){
				list.add(new Notice(rs.getInt("nNo"),
									rs.getString("nTitle"),
									rs.getString("nContent"),
									rs.getString("nWriter"),
									rs.getInt("nCount"),
									rs.getDate("nDate")
								));
			}
	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
	
		return list;
	
	}

	public int insertNotice(Connection conn, Notice n) {
		
	//	String query = "insert into NOTICE values(SEQ_NNO.NEXTVAL,?,?,?,default,?,default)";
		
		String query = prop.getProperty("insertNotice");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result = 0;
		
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
			close(rs);
			close(pstmt);
		}
		
		return result;
	}

	public Notice selectDetail(Connection conn, int no) {
		//String query = "select * from NOTICE where NNO = ?";
		
		String query = prop.getProperty("selectDetail");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Notice n = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // 1 �� �ƴϸ� 0 �� �̱� ������ while���� ���� �ʿ� X
				n = new Notice(
									rs.getInt("NNO"),
									rs.getString("NTITLE"),
									rs.getString("NCONTENT"),
									rs.getString("NWRITER"),
									rs.getInt("NCOUNT"),
									rs.getDate("NDATE"));		
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return n;
	}

	public int updateCount(Connection conn, int no) {
		// ������ ���� �Ẹ��...
		// update notice set ncount = ncount + 1 where nno = ?
		// ��ġȦ���� ������ ==> PreparedStatement
		// update�� ������ ==> int result
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	public int updateNotice(Connection conn, Notice n) {
		// 쿼리부터 작성해보기
		// update notice set ntitle =? , ncontent=?, ndate=? where nno=?
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
		// 쿼리 : update notice set status ='N' where nno = ?
		// 위치홀더가 있으니 PreparedStatement
		// update니까 int result
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteNotice");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,nno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
	
		return result;
	}
	
	
	
	
	
	
	
	
	
	

}
