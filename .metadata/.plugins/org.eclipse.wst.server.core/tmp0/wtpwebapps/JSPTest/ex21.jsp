<%@page import="java.util.Comparator"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//+이 코드는 서버에 저장된 이미지 파일 목록을 가져오는 역할을 해.
	//디렉토리 탐색
	String path = application.getRealPath("/pic"); //→ pic 폴더의 실제 서버 경로를 가져옴.	
	
	
	File dir = new File(path); //→ pic 폴더를 File 객체로 생성.
	File[] list = dir.listFiles();//→ pic 폴더에 있는 파일 리스트를 배열로 가져옴.
	
	//시간 순서대로 정렬
	//System.out.println(list[0].lastModified()); //1741244200469
	
	//o2.lastModified() → 파일의 마지막 수정 시간을 가져옴.
	Arrays.sort(list, new Comparator<File>() {
		public int compare(File o1, File o2) {
			return Long.compare(o2.lastModified(), o1.lastModified()); //→ 최근 수정된 파일이 먼저 나오도록 정렬.
		}
	});
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<style>
		#list {
			display: flex; /* → 이미지 목록을 가로로 정렬. */ 
			 
			flex-wrap: wrap; → /* 가로 공간이 부족하면 자동으로 줄 바꿈. */
		 	
		}
		#list > div > img {
			width: 126px;/* → 썸네일 크기 지정. */
			height: 126px;	
			border: 1px solid #999;
			margin: 9px;	
			padding: 3px;
			object-fit: cover;
		}
		
		#img1 {
			max-width: 490px;
			display: block;
			margin: 15px auto;
		}
		
		#list > div {
			position: relative;
			left: 0;
			top: 0;
		}
		
		#list .delete {
			font-size: 1.5rem;
			cursor: pointer;
			position: absolute;
			right: 14px;
			top: 10px;
			color: white;
		    text-shadow: 
		        -1px -1px 0 #000,
		        1px -1px 0 #000,
		        -1px 1px 0 #000,
		        1px 1px 0 #000,
		        0 0 5px rgba(0,0,0,0.5);
			display: none;
		}
		#list > div:hover .delete {
			display: inline;
		}
		
	</style>
</head>
<body>
	<!-- ex21.jsp -->
	<h1>Image Gallery</h1>
	
	<div id="list">
		<% for (File file : list) /* → 서버의 pic 폴더에 있는 파일을 하나씩 가져옴. */{ %> 
		<div data-modal-button="view" data-filename="<%= file.getName() %>">
			<img src="pic/<%= file.getName() %>">
			<!-- → 이미지 파일을 웹페이지에 표시함. -->
			<span class="delete" 
				onclick="del('<%= file.getName() %>');">&times;</span>
				<!-- → 삭제 버튼 (&times; = ✖)을 추가하고 클릭하면 del() 함수 실행. -->
		</div>
		<% } %>
	</div>
	
	<div data-modal-window="view" data-modal-title="Image">
		<img id="img1"> <!-- → 선택한 이미지를 크게 표시할 공간. -->
		<hr>
		<div>
			<button class="ok" data-modal-ok="view">확인</button>
			<!-- → 확인 버튼 (닫기 기능을 함). -->
		</div>
	</div>
	
	<hr>
	
	<form method="POST" action="ex21_ok.jsp" enctype="multipart/form-data">
	<!-- → 파일을 업로드할 때는 반드시 POST 방식 사용. -->
	
	<table class="vertical">
		<tr>
			<th>이미지</th>
			<td><input type="file" name="attach" required accept="image/*"></td>
			<!-- → 이미지 파일만 선택 가능하도록 설정. -->
		</tr>
	</table>
	<div>
		<button>이미지 업로드</button>
	</div>
	</form>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
		document.querySelectorAll('#list > div').forEach((item)=>{
			/* → 이미지 목록에서 <div> 요소들을 선택. */
			item.addEventListener('click', function() {
				/* → 클릭 이벤트를 추가. */
				//alert();
				//alert(event.currentTarget.dataset['filename']);
				$('#img1').attr('src', 'pic/' + event.currentTarget.dataset['filename']);
				/* → 클릭한 이미지 파일을 img1 태그에 넣음. */
			});
		});
		
		function del(filename) {
			//alert(filename);
			
			if (confirm('delete?')) {
				/* → 삭제 확인 창을 띄움. */
			location.href = 'ex21_del.jsp?filename=' + filename;
				/* → ex21_del.jsp에 삭제할 파일명을 전달. */
			}
			event.stopPropagation();
			/* → 클릭 이벤트가 부모 요소로 전파되는 것을 막음. */
			return false;
			/* → 기본 동작을 막음. */
		}
	
	</script>
</body>
</html>










