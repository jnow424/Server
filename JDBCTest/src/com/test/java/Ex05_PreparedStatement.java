package com.test.java;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

public class Ex05_PreparedStatement {
	
	public static void main(String[] args) {
		
		//Ex05_PreparedStatement.java
		
		//PreparedStatement
		//- 매개변수 지원
	    
	    //Statement VS preparedStatement
	    //1. Statement > 정적 SQL + 텍스트 SQL
	    //2. PreparedStatement > 동적 SQL + 텍스트 SQL
	    //3. CallableStatement > 프로시저 전용
	    
		
		//insert
		String name = "럭스";
		String age = "30";
		String gender = "f";
		String tel = "010";
		String address = "서울시 길동's 하우스";
		
		DBUtil util = new DBUtil();
		Connection conn = null;
		Statement stat = null;
		PreparedStatement pstat = null;
		
		try {
			
			conn = util.open();
			
			//1. Statement
//			stat = conn.createStatement();
//			
//			String sql = String.format("insert into tblAddress (seq, name, age, gender, tel, address, regdate) values (seqAddress.nextVal, '%s', %s, '%s', '%s', '%s', default)", name, age, gender, tel, address);
//			
//			int result = stat.executeUpdate(sql);
//			System.out.println(result);
//			
//			stat.close();
			
			
			//2. PreparedStatement
			//- ? : 오라클의 매개변수 리터럴
			String sql = "insert into tblAddress (seq, name, age, gender, tel, address, regdate) values (seqAddress.nextVal, ?, ?, ?, ?, ?, default)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, name);
			pstat.setString(2, age);
//			pstat.setInt(2, 20);
			pstat.setString(3, gender);
			pstat.setString(4, tel);
			pstat.setString(5, address);
			
			//java.sql.SQLException: 인덱스에서 누락된 IN 또는 OUT 매개변수:: 1
			int result = pstat.executeUpdate();
			System.out.println(result);
			
			
			
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}













