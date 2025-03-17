package com.test.java;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.java.model.AjaxDAO;

@WebServlet("/ex05data.do")
public class Ex05Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex05Data.java
		
		/* btn1.click
		//1. 데이터 가져오기(txt1)
		String txt1 = req.getParameter("txt1"); //직원명
		System.out.println(txt1);
		
		//2. DB 작업
		AjaxDAO dao = new AjaxDAO();
		String jikwi = dao.getJikwi(txt1); //직원명 > 직위 반환
		System.out.println(jikwi);

		//3. 응답 데이터
		resp.setCharacterEncoding("UTF-8");
		PrintWriter writer = resp.getWriter();
		writer.print(jikwi);
		writer.close();
		*/
		
		/*
		//btn2.click
		String txt2 = req.getParameter("txt2"); //직원명
		
		AjaxDAO dao = new AjaxDAO();
		dao.updateBasicpay(txt2);
		*/
		
		//btn3.click
		AjaxDAO dao = new AjaxDAO();
		int basicpay = 3610000;
		
		PrintWriter writer = resp.getWriter();
		writer.print(basicpay);
		writer.close();
		
	}

}

















