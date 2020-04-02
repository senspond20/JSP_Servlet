package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.PageInfo;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/list.bo")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /* 1. 공지사항     : 일반적인 CRUD list insert delete
     * 2. 게시판        : CRUD + 페이징 처리(어렵다.)
     * 3. 사진게시판   : 사진(파일 ) ==> 게시판
     * 
     */
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 게시글의 총 개수 + 2. 각 페이지(1, 2, ...) 게시글 목록을 가져온다.
		BoardService service = new BoardService(); // 두 개의 서비스를 호출하기 때문에 참조변수로 생성
		
		// 게시글 총 개수
		int listCount = service.getListCount();
		System.out.println(listCount);
		
		/*
		 
		 boardLimit : currentPage에서 보여지는 게시글 수
		 
			---------- 게시글 1 ------------
			---------- 게시글 2 ------------
			---------- 게시글 3 ------------
			---------- 게시글 4 ------------
			---------- 게시글 5 ------------
			
				 currentPage : 현재 페이지
			< 1   [2]   3	4	5	6	7	8	9  10 >
			startPage							   endPage
			 11	  12   13  14  15  16  17  18  19  20
			 					pageLimit : 한 화면에서 페이징되는 수
			 
			 ...							
			 									   41
			 									   maxPage
		 */
		int currentPage;		// 현재 페이지
		int pageLimit = 10;		// 한 페이지에 표시될 페이징 수
		int maxPage;			// 전체 페이지 중 마지막 페이지
		int startPage;			// 페이징 된 페이지 중 시작 페이지
		int endPage;		 	// 페이징 된 페이지 중 마지막 페이지
		int boardLimit = 10;	// 한 페이지에 보일 게시글 수
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		maxPage = (int)((double)listCount/ boardLimit + 0.9);			
		//maxPage = (int)((double)(listCount + boardLimit - 1)/boardLimit);
		
		startPage = (((int)((double) currentPage / pageLimit + 0.9) - 1)) * pageLimit + 1;

	//	startPage = (((int)((double)(currentPage + pageLimit - 1)/pageLimit) - 1))* pageLimit;
		endPage = pageLimit + startPage - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		ArrayList<Board> list = service.selectList(currentPage, boardLimit);
		String page = null;
		if(list != null) {
			page ="views/board/boardListView.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi",pi);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회에 실패하였습니다.");
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
