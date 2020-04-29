package board.dao;

import board.Connection;
import board.FileNotFoundException;
import board.FileReader;
import board.IOException;
import board.Notice;
import board.NoticeDAO;
import board.PreparedStatement;
import board.Properties;
import board.SQLException;

public class BoardDAO {
	private Properties prop = new Properties();

	public BoardDAO() {
		String fileName =BoardDAOO.class.getResource("/sql/board/board-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int updateNotice(Connection conn, Board n) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateNotice");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, n.getN_title());
			pstmt.setString(2, n.getN_content());
			pstmt.setInt(3, n.getN_num());
			pstmt.setInt(4, n.getN_num());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
}
