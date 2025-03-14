package com.test.java.map;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.java.model.MapDAO;
import com.test.java.model.MapDTO;

@WebServlet("/map/ex04.do")
public class Ex04 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex04.java
		
		MapDAO dao = new MapDAO();
		ArrayList<MapDTO> list = dao.list();
		
		req.setAttribute("list", list);

		req.getRequestDispatcher("/WEB-INF/views/map/ex04.jsp").forward(req, resp);
	}

}

/*
	MVC 모델을 활용한 지도 마커 시스템 설명
제공된 코드는 MVC(Model-View-Controller) 아키텍처 패턴을 사용하여 지도에 마커를 표시하는 웹 애플리케이션을 구현한 것입니다. 각 구성 요소별로 상세히 설명해 드리겠습니다.

MVC 구성 요소 설명
1. 모델(Model)
모델은 데이터와 비즈니스 로직을 담당합니다:

MapDTO.java
데이터 전송 객체(DTO)로 마커의 정보를 저장하는 클래스입니다.

@Data 어노테이션(Lombok)을 사용하여 getter/setter 등을 자동 생성합니다.

마커의 일련번호(seq), 위도(lat), 경도(lng) 정보를 담고 있습니다.

MapDAO.java
데이터 접근 객체(DAO)로 데이터베이스와의 통신을 담당합니다.

생성자에서 DB 연결을 초기화합니다.

list() 메소드는 tblMarker 테이블의 모든 마커 정보를 조회하여 ArrayList로 반환합니다.

2. 컨트롤러(Controller)
Ex04.java
서블릿으로 구현된 컨트롤러입니다.

/map/ex04.do URL 요청을 처리합니다.

DAO를 통해 마커 데이터를 가져와 request 속성에 저장합니다.

뷰(JSP)로 데이터를 전달하여 화면을 렌더링합니다.

3. 뷰(View)
ex04.jsp
사용자에게 보여지는 화면을 담당합니다.

컨트롤러로부터 전달받은 마커 데이터를 사용하여 지도에 표시합니다.

(파일 내용이 제공되지 않았지만, 일반적으로 HTML, CSS, JavaScript를 사용하여 지도와 마커를 시각화할 것입니다)

데이터베이스 구조
script.sql
tblMarker 테이블 생성 및 초기 데이터를 설정합니다.

테이블은 마커의 일련번호(seq), 위도(lat), 경도(lng) 컬럼으로 구성됩니다.

10개의 샘플 마커 데이터(한독빌딩, 역삼역 등)가 삽입되어 있습니다.

데이터 흐름
사용자가 /map/ex04.do URL에 접속합니다.

Ex04 서블릿이 요청을 받아 MapDAO의 list() 메소드를 호출합니다.

MapDAO는 데이터베이스에서 마커 정보를 조회하여 MapDTO 객체 리스트로 반환합니다.

서블릿은 이 리스트를 request 속성에 저장하고 ex04.jsp로 포워딩합니다.

JSP는 전달받은 마커 데이터를 사용하여 지도에 마커를 표시합니다.

이러한 MVC 패턴은 코드의 유지보수성과 재사용성을 높이며, 각 구성 요소가 독립적으로 동작할 수 있게 합니다.

*/


