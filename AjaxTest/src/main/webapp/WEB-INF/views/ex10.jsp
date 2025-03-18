<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<style>
		
	</style>
</head>
<body>
	<!-- ex10.jsp -->
	<h1>우편번호 검색</h1>
	
	<table class="vertical">
		<tr>
			<th>검색</th>
			<td>
				<input type="text" name="dong" id="dong" required placeholder="동 이름을 입력하세요.">
				<input type="button" value="검색하기" id="btnSearch">
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<select name="address1" id="address1">
					<option disabled selected>검색하세요.</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>상세 주소</th>
			<td>
				<input type="text" name="address2" id="address2" class="full">
			</td>
		</tr>
	</table>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
		$('#btnSearch').click(()=>{
			
			//검색어 > 결과 목록(JSON)
			$.ajax({
				type: 'POST',
				url: '/ajax/ex10data.do',
				data: 'dong=' + $('#dong').val().trim(),
				dataType: 'json',
				success: function(result) {

					//console.log(result);
					
					$('#address1').html('');
					
					result.forEach(item => {
				
						//item > <option>[123-456] 서울 강남구 역삼동 10</option>
						$('#address1').append(`
								<option>[\${item.zipcode}] \${item.sido} \${item.gugun} \${item.dong} \${item.bunji}</option>
						`);
						
					});
					
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});
			
		});
		
		$('#dong').keyup(()=>{
			if (event.keyCode == 13) {
				$('#btnSearch').click();
			}
		});
		
		$('#address1').change(()=>{
			$('#address2').focus();
		});
		
	</script>
</body>
</html>















