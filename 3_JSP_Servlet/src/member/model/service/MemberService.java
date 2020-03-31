package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.*;

import java.sql.Connection;

import member.model.dao.MemberDAO;
import member.model.vo.Member;

public class MemberService {
	
	public Member loginMember(Member m) {
		Connection conn = getConnection();
		
		Member loginUser = new MemberDAO().loginMember(m, conn);
		close(conn);
		return loginUser;
	}
	
	public int insertMember(Member member) {
		Connection conn = getConnection();
		int result = new MemberDAO().insertMember(conn,member);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
}
