package board;
import static common.JDBCTemplate.*;

import board.dao.BoardDAO;

public class BoardService {
	public BoardService() {
		// TODO Auto-generated constructor stub
	}

	public int updateBoard(Board b) {
		Connection conn = getConnection();
		int result = new BoardDAO().updateBoard(conn, b);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
}
