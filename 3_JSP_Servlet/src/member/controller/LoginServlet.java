package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.me") /* 어노테이션 : URL 매핑을 해준다 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		// 만약 아이디에 한글을 허용하게 해줬다면 인코딩
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
	//	System.out.println(userId + ", " + userPwd);
		Member m = new Member(userId, userPwd);
		
		Member loginUser = new MemberService().loginMember(m);
		
		
		/*아래 코드는 잘못 됬다. 
	 	 - request 는 한번만 된다!
		 - login을 하고 나서 board를 갖다온다거나 먼가를 할때 req*/
	/*	if(loginUser != null) {
			request.setAttribute("loginUser", loginUser);
			RequestDispatcher view = request.getRequestDispatcher("index.jsp");
			view.forward(request, response);
		}else {
			request.setAttribute("msg", "로그인 실패");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}*/
		
		if(loginUser != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			session.setMaxInactiveInterval(600);	//10분동안 session 유지
			
			response.sendRedirect("index.jsp");
			// session 이라서 session에 있는 코드는 살아있을것이다.
						
			// request 영역안에서 보내줄것이 있으면 RequestDispatcher / 없으면 sendRedirect
			// 없을떄 sendRedirect를 써야하는 이유 -> 
			// 아무리 request 영역안에 데이터를 담아도 sendRedirect를 쓰면 request 객체를 새로만든다.(request영역에)
			
			
		}else {
			request.setAttribute("msg", "로그인 실패");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
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
