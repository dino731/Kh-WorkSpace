<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<H2> 실기간 대기오염 정보</H2>
	지역 : 
	<select id="location">
		<option>서울</option>
		<option>부산</option>
		<option>대전</option>
		<option>대구</option>
		<option>경기</option>
	</select>
	<button id="btn1">실시간 대기오염정보 확인</button>
	<button id="btn2">어쩌구저쩌구</button>
	<table id="result1" border="1" align="center">
		<thead>
			<tr>
				<th>측정소명</th>
				<th>측정시간</th>
				<th>통합대기환경수치</th>
				<th>미세먼지농도</th>
				<th>일산화탄소농도</th>
				<th>이산질소지수</th>
				<th>아황산가스농도</th>
				<th>오존농도</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	<script>
		$(()=>{
			$("#btn1").click(()=>{
				$("tbody").html("");
				$.ajax({
					url : 'air.do',
					data : {"location" : $("#location").val()},
					success : data =>{
						console.log(data);
						/* var jsondata = json.parse(data); */
						let value="";
						for( let item of data.response.body.items){
							value += `<tr>
									<td>${item.stationName}</td>
									<td>${item.dataTime}</td>
									<td>${item.khaiValue}</td>
									<td>${item.pm10Value}</td>
									<td>${item.coValue}</td>
									<td>${item.no2Value}</td>
									<td>${item.so2Value}</td>
									<td>${item.o3Value}</td>
							</tr>`;
						}
						$("#result1>tbody").html(value);
							//console.log(item);
						/* 	$("#result1").append(
									$("<tr></tr>")
									.append($("<td></td>").text(item.stationName))
									.append($("<td></td>").text(item.dataTime))
									.append($("<td></td>").text(item.khaiValue))
									.append($("<td></td>").text(item.pm10Value))
									.append($("<td></td>").text(item.coGrade))
									.append($("<td></td>").text(item.no2Grade))
									.append($("<td></td>").text(item.so2Grade))
									.append($("<td></td>").text(item.o3Grade))
									
							); */
						/* } */
					}
				})
			})
			$("#btn2").click(()=>{
				$("tbody").html("");
				$.ajax({
					url:"air2.do",
					data:{location : $("#location").val()},
					success : data => {
						// WebWorkspace1, Ajax
						console.log(data);
						$(data).find('item').each(function(){
							var stationName = $(this).find("stationName").text();
							var dataTime = $(this).find("dataTime").text();
							var khaiValue = $(this).find("khaiValue").text();
							var pm10Value = $(this).find("pm10Value").text();
							var coGrade = $(this).find("coValue").text();
							var no2Grade = $(this).find("no2Value").text();
							var so2Grade = $(this).find("so2Value").text();
							var o3Grade = $(this).find("o3Value").text();
							
							//var gogo = stationName+dataTime+khaiValue+pm10Value+coGrade+no2Grade+so2Grade+o3Grade;
							$("#result1>tbody").append(
									"<tr>"+
									"<td>"+stationName+"</td>"+"<br>"
									+"<td>"+dataTime+"</td>"+"<br>"
									+"<td>"+khaiValue+"</td>"+"<br>"
									+"<td>"+pm10Value+"</td>"+"<br>"
									+"<td>"+coGrade+"</td>"+"<br>"
									+"<td>"+no2Grade+"</td>"+"<br>"
									+"<td>"+so2Grade+"</td>"+"<br>"
									+"<td>"+o3Grade+"</td>"+"<br>"
									+"</tr>");
							
						});
					}
				})
				
			})
			
			
			
		});
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>