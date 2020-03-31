package com.kh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// jsp는 html과 다르게 데이터를 받아와서 출력할 수 있다.

public class TestServlet4 extends HttpServlet{
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
      req.setCharacterEncoding("UTF-8");
      
      String name = req.getParameter("name");
      String gender = req.getParameter("gender"); 
      String age = req.getParameter("age");
      String city = req.getParameter("city");
      String height = req.getParameter("height");

      String[] foodArr = req.getParameterValues("food");
      String recommendation ="";
      
      switch(age) {
	      case "10대 미만" : recommendation ="뽀로로";break;
	      case "10대" : recommendation = "펭수"; break;
	      case "20대" : recommendation = "핑구"; break;
	      case "30대" : recommendation = "돈"; break;
	      case "40대" : recommendation = "집"; break;
      }
      
      req.setAttribute("name", name);
      req.setAttribute("gender", gender);
      req.setAttribute("age", age);
      req.setAttribute("city", city);
      req.setAttribute("height", height);
      String foods = String.join(", ", foodArr);
      req.setAttribute("foods", foods);
      req.setAttribute("recommendation", recommendation);
      
      RequestDispatcher view = req.getRequestDispatcher("servlet/testServlet4End.jsp");
      view.forward(req, resp);
   }

}