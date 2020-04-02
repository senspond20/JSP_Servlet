package board.model.service;

import static common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDAO;
import board.model.vo.Board;

public class BoardService {

	public int getListCount() {
		Connection conn = getConnection();
		int result = new BoardDAO().getListCount(conn);
		close(conn);
		return result;
	}

	public ArrayList<Board> selectList(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDAO().selectList(conn, currentPage,boardLimit);
		
		close(conn);
		
		return list;
	}

	public int insertBoard(Board b) {
		Connection conn = getConnection();
		int result = new BoardDAO().insertBoard(conn, b);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	public Board selectBoard(int bid) {
		Connection conn = getConnection();
		BoardDAO dao = new BoardDAO();  // BoardDAO 두개를 호출해야하기 떄문에 참조변수 선언
		
		int result = dao.updateCount(conn,bid); 
		// 게시판 상세보기 시 조회수가 증가해야하기 때문에 게시판 상세보기 서비스에는 조회수 증가하는 기능도 구현해야함
		Board board = null;
		
		if(result > 0) {
			board = dao.selectList(conn, bid);
			if(board != null) {
				commit(conn);		
			}else {
				rollback(conn);
			}
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return board;
	}



}
