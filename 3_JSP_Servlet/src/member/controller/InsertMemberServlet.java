package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class InsertMemberServlet
 */
@WebServlet("/insert.me")
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String joinUserId = request.getParameter("joinUserId");
		String joinUserPwd = request.getParameter("joinUserPwd");
		String joinUserPwd2 = request.getParameter("joinUserPwd2");
		String userName = request.getParameter("userName");
		String nickName = request.getParameter("nickName");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String irr[] = request.getParameterValues("interest");
		
		System.out.println(joinUserId);
		
		String interest = "";
		
		if(irr != null) {
			for(int i = 0; i < irr.length; i++) {
				if(i == irr.length - 1) {
					interest += irr[i];
				}else {
					interest += irr[i] + ", ";
				}
			}
		}
		Member member = new Member(joinUserId,joinUserPwd,userName,nickName,
								   phone, email, address,  interest, null,null,null);
		
		System.out.println(member.toString());
	
		int result = new MemberService().insertMember(member);
		String page = "";
		String msg = "";
		
		if(result > 0) {
//			page = request.getContextPath();
			
			page = "/";
			msg = "회원가입에 성공했습니다.";
			
//			request.setAttribute("msg", "회원가입에 성공했습니다.");
//			RequestDispatcher view = request.getRequestDispatcher(request.getContextPath());
//			view.forward(request, response);
		}else {
//			page = request.getContextPath();
			page = "views/common/errorPage.jsp";
			msg = "회원가입에 성공했습니다.";
//			request.setAttribute("msg", "회원가입에 실패했습니다.");
//			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
//			view.forward(request, response);
		}
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
