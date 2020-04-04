package board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import board.model.service.BoardService;
import board.model.vo.Attachment;
import board.model.vo.Board;
import common.myFileRenamePolicy;
import member.model.vo.Member;

/**
 * Servlet implementation class ThumbnailInsertServlet
 */
@WebServlet("/insert.th")
public class ThumbnailInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumbnailInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
//		String title = request.getParameter("title");
//		System.out.println(title);
		
		// enctype이 multipart/form-date로 전송되었는지 확인
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10; // 10MByte로 전송파일 용량 제한
			String root = request.getSession().getServletContext().getRealPath("/");
//			System.out.println(request.getSession());
//			System.out.println(request.getSession().getServletContext());
//			System.out.println(request.getSession().getServletContext().getRealPath("/"));
			
			String savePath = root + "thumbanil_uploadFiles/";
		//	System.out.println(savePath);
			
			//import com.oreilly.servlet.MultipartRequest;
//			MultipartRequest multiRequest 
//			= new MultipartRequest(request, savePath, maxSize, new DefaultFileRenamePolicy());
			/*
			 * aaa.zip
			 * aaa1.zip
			 * aaa2.zip
			 * 
			 */
			
			MultipartRequest multiRequest 
			= new MultipartRequest(request, savePath, maxSize, "UTF-8", new myFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();   // 바뀐 파일의 이름 저장
			ArrayList<String> originFiles = new ArrayList<String>(); // 원본 파일의 이름 저장
			
			Enumeration<String> files = multiRequest.getFileNames(); // 폼에서 전송된 파일 리스트들의 name 반환
			while(files.hasMoreElements()) {
				String name = files.nextElement();
//				System.out.println(name); 거구로 나온다.
				
//				System.out.println(multiRequest.getFilesystemName(name));
				if(multiRequest.getFilesystemName(name) != null) {
					// multiRequest.getFilesystemName(name) : MyRenameFilePolicy 를 따라서 rename된것을 가져온다.
					
					saveFiles.add(multiRequest.getFilesystemName(name));
					originFiles.add(multiRequest.getFilesystemName(name));
					// getOriginalFileName() : 실제 사용자가 업로드 할때의 파일 명
				}
			}
			
			// -- 받아온것
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			String bWriter = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
			
			// ============================================================================
			
			// -- 보낼것
			Board b = new Board();
			b.setbTitle(title);
			b.setbContent(content);
			b.setbWriter(bWriter);
			
//			System.out.println(saveFiles);
//			System.out.println(originFiles);
			
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			for(int i = originFiles.size()-1; i >= 0; i--) {
				Attachment at = new Attachment();
				at.setFilePath(savePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				
				if(i == originFiles.size() - 1) {
					at.setFileLevel(0);
				}else {
					at.setFileLevel(1);
				}
				
				fileList.add(at);
			}
			
			int result = new BoardService().insertThumbnail(b, fileList);
			if(result > 0) {
				response.sendRedirect("list.th");
			}else {
				for(int i = 0; i < saveFiles.size(); i ++) {
					File failedFile = new File(savePath + saveFiles.get(i));
					failedFile.delete();
				}
				
				request.setAttribute("msg", "사진 게시판 등록에 실패하였습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
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
