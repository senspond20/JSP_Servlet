package notice.model.service;

import static common.JDBCTemplate.*;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import notice.model.dao.NoticeDAO;
import notice.model.vo.Notice;

public class NoticeService {
	
	public ArrayList<Notice> selectList(){
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDAO().selectList(conn);
		close(conn);
		
		return list;
	}
	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		int result = new NoticeDAO().insertNotice(conn,n);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	public Notice selectDetail(int no) {
		Connection conn = getConnection();
		
		// ��ȸ���� �ö󰡾��ϹǷ�
		NoticeDAO nDAO = new NoticeDAO();
		int result = nDAO.updateCount(conn,no);
		
		// �󼼺���
		Notice n = null;
		
		if(result > 0) {	
			n = new NoticeDAO().selectDetail(conn,no);
			if(n != null) {
				commit(conn); // �� Ŀ���� ��ȸ�� ������Ʈ�� ���� Ŀ��
			}else {
				rollback(conn);
			}
		}
		
		close(conn);
		return n;
	}
	public int updateNotice(Notice n) {
		Connection conn = getConnection();
		int result = new NoticeDAO().updateNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	public int deleteNotice(int nno) {
		
		Connection conn = getConnection();
		int result = new NoticeDAO().deleteNotice(conn, nno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
	
	
	
	
	
}
