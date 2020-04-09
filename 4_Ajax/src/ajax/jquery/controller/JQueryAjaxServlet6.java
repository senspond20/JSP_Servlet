package ajax.jquery.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import ajax.jquery.model.vo.User;

/**
 * Servlet implementation class JQueryAjaxServlet6
 */
@WebServlet("/jQueryTest6.do")
public class JQueryAjaxServlet6 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JQueryAjaxServlet6() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<User> userList = new ArrayList<User>();
		userList.add(new User(1,"박신우","한국"));
		userList.add(new User(2,"타일러 라쉬","미국"));
		userList.add(new User(3,"쯔위","중국"));
		userList.add(new User(4,"모모","일본"));
		userList.add(new User(5,"리사","태국"));
		userList.add(new User(6,"알베르토 몬디","이탈리아"));
		userList.add(new User(7,"샘 오취리","가나"));
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		User user = null;
		for(int i =0;i<userList.size();i++) {
			if(userList.get(i).getUserNo() == userNo) {
				user = userList.get(i);
				break;
			}
		}
		// 객체 여러개를 담을수있는 JSONArray 생성
		JSONArray userArr = new JSONArray();
		JSONObject userObj = null;
		
		if(user != null) {
			userObj = new JSONObject();
			
			userObj.put("userNo", user.getUserNo());
			userObj.put("userName", user.getUserName());
			userObj.put("userNation", user.getUserNation());
			
			userArr.add(userObj);
		} else {
			for(User userInfo : userList) {
				userObj = new JSONObject();
				
				userObj.put("userNo", userInfo.getUserNo());
				userObj.put("userName", userInfo.getUserName());
				userObj.put("userNation", userInfo.getUserNation());
				
				userArr.add(userObj);
			}
		}
		
		response.setContentType("application/json; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.println(userArr);
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
