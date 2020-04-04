package board.model.dao;

import static common.JDBCTemplate.close;

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

import board.model.vo.Attachment;
import board.model.vo.Board;

public class BoardDAO {
	private Properties prop = new Properties();
	
	public BoardDAO() {
		String fileName = BoardDAO.class.getResource("/sql/board/board-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int getListCount(Connection conn) {
		// select count(*) from board where status = 'Y' and btype=1
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return result;
	}

	public ArrayList<Board> selectList(Connection conn, int currentPage, int boardLimit) {
/*
		SELECT RNUM,BID, BTYPE, CNAME, BTITLE, BCONTENT, NICKNAME, BCOUNT, CREATE_DATE, MODIFY_DATE, STATUS
		FROM(SELECT ROWNUM RNUM, BID, BTYPE, CNAME, BTITLE, BCONTENT, NICKNAME, BCOUNT, CREATE_DATE, MODIFY_DATE, STATUS  
		    FROM(SELECT BID, BTYPE, CNAME, BTITLE, BCONTENT, NICKNAME, BCOUNT, CREATE_DATE, B.MODIFY_DATE, B.STATUS
		        FROM BOARD B
		            JOIN MEMBER ON(BWRITER = USER_ID)
		            JOIN CATEGORY USING(CID)
		        WHERE B.STATUS = 'Y'
		    ORDER BY BID DESC ))
		WHERE BTYPE =1 AND RNUM BETWEEN ? AND ?;
		==> 한줄로 넣어야한다.

		-- view 
		CREATE OR REPLACE VIEW BLIST
		AS 
		SELECT RNUM,BID, BTYPE, CNAME, BTITLE, BCONTENT, NICKNAME, BCOUNT, CREATE_DATE, MODIFY_DATE, STATUS
		FROM(SELECT ROWNUM RNUM, BID, BTYPE, CNAME, BTITLE, BCONTENT, NICKNAME, BCOUNT, CREATE_DATE, MODIFY_DATE, STATUS  
		    FROM(SELECT BID, BTYPE, CNAME, BTITLE, BCONTENT, NICKNAME, BCOUNT, CREATE_DATE, B.MODIFY_DATE, B.STATUS
		        FROM BOARD B
		            JOIN MEMBER ON(BWRITER = USER_ID)
		            JOIN CATEGORY USING(CID)
		        WHERE B.STATUS = 'Y'
		    ORDER BY BID DESC ));

		SELECT * FROM BLIST WHERE RNUM BETWEEN ? AND ? AND BTYPE=1;

*/
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectList");
		
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Board>();
			while(rset.next()) {
				Board b = new Board(rset.getInt("bid"),
									rset.getInt("btype"),
									rset.getString("cname"),
									rset.getString("btitle"),
									rset.getString("bcontent"),
									rset.getString("nickname"),
									rset.getInt("bcount"),
									rset.getDate("create_date"),
									rset.getDate("modify_date"),
									rset.getString("status"));
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	
		return list;
	}

	public int insertBoard(Connection conn, Board b) {
		// insert into board values(seq_bid.nextval, 1, ?, ?,?,?,default, sysdate,sysdate,default)
		
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(b.getCategory()));
			pstmt.setString(2, b.getbTitle());
			pstmt.setString(3, b.getbContent());
			pstmt.setString(4, b.getbWriter());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
		return result;
	}

	public int updateCount(Connection conn, int bid) {
		// update board set bcount = bcount + 1 where bid = ?
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
	
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bid);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		/*finally {
			close(conn);
		}* 여기서 닫아버리면 두번쨰 selectBoard 서비스를 못한다. */
		
		return result;
	}

	public Board selectList(Connection conn, int bid) {
		// select * from bdetail where bid = ?
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board board = null;
		
		String query = prop.getProperty("selectBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bid);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				board = new Board(rset.getInt("bid"),
								  rset.getInt("btype"),
								  rset.getString("cname"),
								  rset.getString("btitle"),
								  rset.getString("bcontent"),
								  rset.getString("nickName"),
								  rset.getInt("bcount"),
								  rset.getDate("create_date"),
								  rset.getDate("modify_date"),
								  rset.getString("status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return board;
	}

	public ArrayList selectBList(Connection conn) {
		//쿼리 : select * from board where btype=2
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectBList");
			
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Board>();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("bid"),
								   rset.getInt("btype"),
								   rset.getString("cname"),
								   rset.getString("btitle"),
								   rset.getString("bcontent"),
								   rset.getString("nickname"),
								   rset.getInt("bcount"),
								   rset.getDate("create_date"),
								   rset.getDate("modify_date"),
								   rset.getString("status")
								   ));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public ArrayList selectFList(Connection conn) {
		// select * from attachment where file_level=0 and status ='Y'
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> list = null;
	
		String query = prop.getProperty("selectFList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<Attachment>();
			
			while(rset.next()) {
				list.add(new Attachment(rset.getInt("bid"), rset.getString("change_name")));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public int insertAttachment(Connection conn, ArrayList<Attachment> fileList) {
		// 쿼리
		// insert into attachment values(seq_fid.nextval, seq_bid.currval, ?,?,?,sysdate,?,default,default)
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAttachment");
		try {
			for(int i = 0; i < fileList.size(); i++) {
				Attachment at = fileList.get(i);
				
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileLevel());
				
				result += pstmt.executeUpdate();
			}
			pstmt = conn.prepareStatement(query);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int inserThBoard(Connection conn, Board b) {
		// insert into board values(seq_bid.nexval,2,10,?,?,?,default,sysdate,sysdate,default)
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertThBoard");
	
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getbTitle());
			pstmt.setString(2, b.getbContent());
			pstmt.setString(3, b.getbWriter());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Attachment> selectThumbnail(Connection conn, int bid) {
		// select * from attachment where bid = ? and status ='Y' order by fid
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> list = null;
		
		String query = prop.getProperty("selectThumnail");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bid);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Attachment>();
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setfId(rset.getInt("fid"));
				at.setOriginName(rset.getString("origin_name"));
				at.setChangeName(rset.getString("change_name"));
				at.setFilePath(rset.getString("file_path"));
				at.setUploadDate(rset.getDate("upload_date"));
				
				list.add(at);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
}
