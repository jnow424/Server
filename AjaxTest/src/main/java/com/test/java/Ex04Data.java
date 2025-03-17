package com.test.java;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.java.model.AjaxDAO;

@WebServlet("/ex04data.do")
public class Ex04Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex04Data.java
		//- Ajax 응답용
		//	- 이 서블릿이 반환하는 내용 > HTML,CSS,JavaScript 포함(X) > ajax가 해석을 못하기 때문에..
		//	- ajax == 자바스크립트 객체 > 응답하는 내용은 자바스크립트가 이해할 수 있는 데이터면 모두 가능~
		
		
		AjaxDAO dao = null;//= new AjaxDAO();
		String question = dao.listSurvey().get(0).getQuestion();
		
		resp.setCharacterEncoding("UTF-8");
		PrintWriter writer = resp.getWriter();
		//writer.print(100);
		writer.print(question);
		writer.close();
		
	}

}









