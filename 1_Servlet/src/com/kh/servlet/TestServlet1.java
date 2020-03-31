package com.kh.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestServlet1 extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		String gender = req.getParameter("gender");
		String city = req.getParameter("city");
		String height = req.getParameter("height");
		String[] foodArr = req.getParameterValues("food");
		
//		System.out.println(name);
//		System.out.println(age);
//		System.out.println(gender);
//		System.out.println(city);
//		System.out.println(height);
//		System.out.println(foodArr);
//	
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>개인 정보 출력 화면</title>");
		
		out.println("<style>");
		out.println("h2{color:red; }");
		out.println("span.name{color:orange; font-weight: bold;}");
		out.println("span.gender{color:yellow; font-weight: bold; background-color:black;}");
		out.println("span.age{color:green; font-weight: bold;}");
		out.println("span.city{color:blue; font-weight: bold;}");
		out.println("span.height{color:navy; font-weight: bold;}");
		out.println("span.food{color:purple; font-weight: bold;}");
		
		out.println("</style>");
		out.println("</head>");
		out.println("</body>");
		out.println("<h2>개인취향 테스트 결과(GET)</h2>");
		out.printf("<span class ='name'>%s</span>님은", name);
		out.printf("<span class ='age'>%s</span>님은", age);
		out.printf("<span class ='city'>%s</span>님은", city);
		out.printf("키 <span class ='height'>%s</span>cm인", height);
		out.printf("<span class ='gender'>%s</span>님은", name);
		out.print("좋아하는 음식은 <span class = 'food'>");
		
		for(int i = 0; i < foodArr.length; i++) {
			if(i == 0) {
				out.printf("%s", foodArr[i]);
			}else {
				out.printf(", %s", foodArr[i]);
			}
		}
	
		
		out.println("</span>입니다.");
		out.println("</body>");
		out.println("</html>");
	//	super.doGet(req, resp);
	}
	
}
