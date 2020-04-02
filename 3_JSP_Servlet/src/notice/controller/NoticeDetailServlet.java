package notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeDetailServlet
 */
@WebServlet("/detail.no")
public class NoticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 
		// url�� �ִ� no��� �ϴ� �Ķ������ ���� ��������
		int no = Integer.parseInt(request.getParameter("no"));
		// getParameter�� ��ȯ ���� String�̱� ������ int�� ��ȯ�ϱ� !
		
		Notice n = new NoticeService().selectDetail(no);	
		
		String page = null;
		
		if(n != null) {
			page = "views/notice/noticeDetailView.jsp";
			// �ϳ��� �������� ������ ������ �� �̱� ������
			request.setAttribute("nView", n);
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "�������� ��ȸ�� �����߽��ϴ�.");
		}
	
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
