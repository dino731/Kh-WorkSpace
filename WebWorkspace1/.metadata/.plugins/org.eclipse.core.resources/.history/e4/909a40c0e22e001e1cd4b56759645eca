<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.model.vo.Person" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>JSTL Core Library</h1>
   
   <h3>1. 변수(속성)</h3>
   
   <pre>
      *변수 선언(&lt;c:set var="변수명" value='리터럴' scope='스코프영역지정(생략가능)' &gt;)
      - 변수를 선언하고 초기값을 대입해주는 기능을 제공
      - 해당 변수를 어떤 scope에 담아둘껀지 지정가능함(생략시 pageScope)
      => 즉, 해당 scope영역에 setAttribute라는 메소드를 이용해서 key+value로 담아놓는것과 같다.
      => c:set을 통해 선언된 변수는 EL로 접근해서 사용 가능(단, 스크립팅 원소는 접근 불가)
      
      * 주의사항
      - 변수는 타입(자료형)을 별도로 지정하지 않음
      - 반드시 해당 변수의 담아두고자 하는 초기값 속성을 무조건 셋팅해줘야함.
   </pre>
   
   <c:set var="num1" value="10"/>
   <c:set var="num2" value="20" scope="request"/>
   
   num1의 변수값 : ${num1 } <br>
   num2의 변수값 : ${num2 } <br>
   
   <c:set var="result" value="${ num1+num2 }" scope="session"/>
   
   result 변수값 : ${ result } <br><br>
   
   <!--  
      변수명만 지정하여 제시하면 공유범위가 가장 적은 스코프부터 값을 찾아지게됨.   
    -->
   ${ num1 } <br> 
   ${ pageScope.num1 } <br>
   ${ num2 } <br>
   ${ requestScope.num2 } <br>
   ${ sessionScope.result } <br>
   
   
   <c:set var="result" scope="request">
      9999
   </c:set>
   
   ${result } <br>
   
   <hr>
   
   <pre>
   * 변수 삭제 (&lt;c:remove var="제거하고자하는변수명" scope="스코프영역지정(생략가능)"&gt;)
   - 해당변수를 scope에서 찾아서 제거하는 태그
   - scope 지정생략시 모든 scope에서 해당 변수를 다 찾아서 제거함
   => 해당 scope에 .removeAttribute를 사용해서 제거하는것과 동일함.   
   </pre>
   
   삭제전 result : ${result } <br><br>
   
   1) 특정 scope 지정해서 삭제 <br>
   <%-- <c:remove var="result" scope="request"/> --%>
   request에서 삭제후 result : ${result } <br><br>
   
   2) 모든 scope에서 삭제시키기 <br>
   <c:remove var="result"/>
   삭제후 result : ${result } <br><br>
   
   <hr>
   
   <pre>
   *변수출력 (&lt;c:out value="출력하고자하는 값" default="기본값(생략가능)" escapeXml="true(기본값, 생략가능)"&gt;)
   - 데이터를 출력하고자 할 때 사용하는 태그
   - 기본값 : value에 출력하고자하는 값이 없을경우 대체문구 추가(생략가능)
   - escapeXml : 태그로써 해석해서 출력할지 여부(생략가능, 생략시 true가 기본값.)
   </pre>
   
   result : <c:out value="${result }"/> <br>
   default를 설정한 result : <c:out value="${result }" default="없어요" /> <br><br>
   
   <!-- escapeXml 테스트 -->
   <c:set var="outTest" value="<b>출력테스트</b>" />
   <c:out value="${outTest }"/><!-- escapeXml 생략시 기본값이 true == 태그로써 해석이 안된다. -->
   <c:out value="${outTest }" escapeXml="false"/> <br>
   
   <hr>
   
   <h3>2. 조건문 - if (&lt;c:if test="조건식" &gt;)</h3>
   <pre>
   - JAVA의 단일 if문과 비슷한 역할을 하는 태그
   - 조건식은 test라는 속성에 작성 , 반드시 EL 표현식으로 작성해야한다.
   </pre>
   
   <c:if test="${num1 gt num2 }">
      <b>num1이 num2보다 큽니다.</b>
   </c:if>
   
   <c:if test="${num1 lt num2 }">
      <b>num1이 num2보다 작습니다.</b>
   </c:if>
   
   <br>
   
   <c:set var="str" value="안녕하세요" />
   
   <c:if test="${str eq '안녕하세요' }">
      <mark>hello</mark>   
   </c:if>
   
   <c:if test="${str ne '안녕하세요' }">
      <mark>hello world</mark>   
   </c:if>
   
   <br>
   
   <h3>3. 조건문 - choose(&lt;c:choose&gt; , &lt;c:when&gt; , &lt;c:otherwise&gt;)</h3>
   <pre>
      - JAVA의 if-else, if-else if문 또는 switch문과 비슷한 역할을 하는 태그
      - 각 조건들을 c:choose의 하위요소로 c:when을 통해서 작성한다.
   </pre>
   
   <c:choose>
      <c:when test="${ num1 eq 20 }"><!--  if -->
         <b>처음 뵙겠습니다</b>
      </c:when>
      <c:when test="${ num1 eq 10 }"><!-- else if -->
         <b>다시 봐서 반갑습니다</b>
      </c:when>
      <c:otherwise><!--  else -->
         <b>안녕히가세요</b>
      </c:otherwise>      
   </c:choose>
   
   <hr>
   
   <h3>4. 반복문 - forEach</h3>
   <pre>
   for loop문 - (&lt;c:forEach var='변수명' begin='초기값' end='종료값' step='증가값(생략가능); &gt;)
   향상된 for문 - (&lt;c:forEach var='변수명' items="순차적으로 접근할 배열또는컬렉션" varStatus="현재 접
   근된 요소의 상태값을 보관할 변수명(생략가능)"&gt;)
   => step : 지정하지 않을시 기본값 1
   => varStatus : 현재 접근된 요소의 상태값을 보관할 변수명(생략가능)
   </pre>
   
   <!-- for loop문  -->
   <%
      for(int i = 0; i<10; i++){
         
      }
   %>
   
   <c:forEach var="i" begin="1" end='10'>
      반복확인 : ${i } <br>
   </c:forEach>
   
   <c:forEach var="i" begin="1" end='10' step="2">
      반복확인 : ${i } <br>
   </c:forEach>
   
   <c:forEach var="i" begin="1" end="6">
      <h${i }>태그안에 el표현식 사용 </h${i }>
   </c:forEach>
   
   <br>
   
   <!-- 향상된 for문. -->
   <c:set var="colors">
      red, yellow, green, pink
   </c:set>
   
   colors 값 : ${colors } <br>
   
   <ul>
      <c:forEach var="c" items="${colors }">
         <li style="color:${c}">${c }</li>
      </c:forEach>
   </ul>
   
   <br>
   
   <%
      ArrayList<Person> list = new ArrayList();
      list.add(new Person("홍길동",19,"남자"));
      list.add(new Person("오창정",25,"남자"));
      list.add(new Person("이준호",35,"남자"));
      
      request.setAttribute("list",list); // 여기까지가 원래 Servlet에서 작성해야했을 코드들
   %>
   
   <table border="1">
      <thead>
         <tr>
            <th>순번</th>
            <th>이름</th>
            <th>나이</th>
            <th>성별</th>
         </tr>
      </thead>
      <tbody>
         <%-- <% if(list.isEmpty()) { %>
            <tr align="center">
               <td colspan="4">조회 결과가 없습니다.</td>
            </tr>
         <% } else {%>
            <% for(int i =0; i<list.size(); i++) { %>
               <tr>
                  <td><%=i %></td>
                  <td><%= list.get(i).getName() %></td>
                  <td><%= list.get(i).getAge() %></td>
                  <td><%= list.get(i).getGender() %></td>
               </tr>
            <% } %>
         <% } %> --%>
         <c:if test="${ empty list }">
            <tr align="center">
               <td colspan="4">조회 결과가 없습니다.</td>
            </tr>
         </c:if>
         <!-- 기본 반복문 -->
         <c:forEach var='i' begin='0' end='${list.size() - 1}'>
            <tr>
               <td>${i}</td>
               <td>${list.get(i).name }</td>
               <td>${list.get(i).age }</td>
               <td>${list.get(i).gender }</td>
            </tr>
         </c:forEach>
        <c:forEach var="person" items="&{list" varStatus='status'>
        <c:set var="count" value="${count+1 }"/>
            <tr>
            	<td>${counst }</td>
            <%-- <td>${status.last }</td> --%>
            <!-- 
            	status의 속성값
            	index : 0부터 시작
            	count : 1부터 시작
            	first : 첫 반복시 true / 그 외 false
            	last : 마지막 반복시 true / 그 외 false
             -->
               <td>${ person}</td>
               <td>${ person.name}</td>
               <td>${person.age }</td>
               <td>${person.gender }</td>
            </tr>
         </c:forEach>
      </tbody>
   </table>
   
   <hr>
   <h3>5. 반복문 - forTokens</h3> 
   <pre>
  	&lt;c:forTokens var="변수" items="문자열" delims="구분자"&gt; 
  	- 구분자를 통해서 분리된 각각의 문자열에 순차적으로 접근하면서 반복 수행
  	- JAVA의 split("구분자") 또는  StringTokenizer와 비슷한 역할.
   </pre>
   
   <c:set var="device" value="컴퓨터, 휴대폰, 텔레비/에어컨,냉장고!세탁기"/>
   <ul>
   	<c:forTokens var="de" items="${device }" delims=",/.!">
   		<li>${de }</li>
   	</c:forTokens>
   </ul>
   
   
   <hr>
   
   <h3>6. 쿼리스트링 관련 - url, param</h3>
   <pre>
   	&lt;c:url var="" value="요청할url"&gt;
   		&lt;c:param name="키값" value="밸류값"/&gt;
   		&lt;c:param name="키값" value="밸류값"/&gt;
   		&lt;c:param name="키값" value="밸류값"/&gt;
   		&lt;c:param name="키값" value="밸류값"/&gt;
   	&lt;c:url&gt;
   	- url경로를 생성하고, 쿼리스트링을 정의할 수 있는 태그
   	- 넘겨야할 쿼리 스트링이 길 경우 사용하면 간편하다.
   </pre>
   
   <a href="list.do?cPage=1&keyword=mkm&category=name">기존방식</a> <br>
   
   <c:url var="query" value="list.do">
   	<c:param name="cPage" value="1"/>
   	<c:param name="keyword" value="mkm"/>
   	<c:param name="category" value="name"/>
   </c:url>
   
   <a href="${query }">c:url을 활용한 방식</a>
   <c:import url="/el.do">
   </c:import>
   
   <c:redirect url="/"></c:redirect>
   
   
   
   
   
   
   
   
   
   
   
   
   
</body>
</html>