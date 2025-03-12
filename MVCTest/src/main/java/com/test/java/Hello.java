package com.test.java;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Hello extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /* PrintWriter writer = resp.getWriter(); */
      //writer.write("<h1>Hello</h1>");
      
      //업무 코드 작성~
      //- DB 작업 > select
      String name = "홍길동";
      
      req.setAttribute("name", name);
      System.out.println(req.getAttribute("name"));
      
      //resp.sendRedirect("/mvc/hello.jsp);
      //pageContext.forward("/mvc/hello.js"p");
      
      //pageContext 역할
      RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/hello.jsp");
      dispatcher.forward(req, resp);
    }
}

























