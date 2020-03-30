package com.kh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestServlet3 extends HttpServlet{
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
      req.setCharacterEncoding("UTF-8");
      
      String name = req.getParameter("name");
      String gender = req.getParameter("gender"); 
      String age = req.getParameter("age");
      String city = req.getParameter("city");
      String height = req.getParameter("height");
		
      String recommendation ="";
      switch(age) {
      case "10대 미만" : recommendation ="戮�濡쒕줈";break;
      case "10대" : recommendation = "�렚�닔"; break;
      case "20대" : recommendation = "�븨援�"; break;
      case "30대" : recommendation = "�룉"; break;
      case "40대" : recommendation = "吏�"; break;
      }
      
      System.out.println(name);
      System.out.println(gender);
      System.out.println(age);
      System.out.println(city);
      System.out.println(height);


      String[] food = req.getParameterValues("food");
      for(int l = 0; l<food.length; l++) {
         System.out.println(food[l]);      
      }
      
      resp.setContentType("text/html; charset=UTF-8");
      PrintWriter out = resp.getWriter();
      out.println("<html>");
      out.println("<head>");
      out.println("<title>媛쒖씤�젙蹂댁텧�젰�솕硫�</title>");
      out.println("<style>");
      out.println("h2{color : red;}");
      out.println("span.name{color : orange; font-weight : bold;}");
      out.println("span.gender{color : yellow; font-weight : bold; background-color:black;}");
      out.println("span.age{color : green; font-weight : bold;}");
      out.println("span.city{color : blue; font-weight : bold;}");
      out.println("span.height{color : navy; font-weight : bold;}");
      out.println("span.food{color : purple; font-weight : bold;}");
      out.println("</style>");
      out.println("<body>");
      out.println("<h2>媛쒖씤痍⑦뼢 �뀒�뒪�듃 寃곌낵(POST)</h2>");
      out.printf("<span class='name'>%s</span>�떂��",name);
      out.printf("<span class='age'>%s</span>�씠�떆硫�",age);
      out.printf("<span class='city'>%s</span>�뿉 �궗�뒗",city);
      out.printf("<span class='height'>%s</span>cm�씤",height);
      out.printf("<span class='gender'>%s</span>�엯�땲�떎",gender);
      out.print("醫뗭븘�븯�뒗 �쓬�떇�� <span class ='food'>");
      for(int i = 0; i < food.length; i++) {
         if(i==0) {
            out.printf("%s", food[i]);
         } else {
            out.printf(",%s", food[i]);
         }
         
      }
      out.println("</span>�엯�땲�떎.");
      out.println("<hr>");
      out.println("<h3>" + age + "�뿉 留욌뒗 �꽑臾� 異붿쿇</h3>");
      out.println("'" + recommendation + "' �꽑臾쇱� �뼱�뼚�떊媛��슂?");
      out.println("</body>");
      out.println("</head>");
      out.println("</html>");
      
   }

}