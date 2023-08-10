<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="${contextPaht }/resources/css/main-style.css" rel="stylesheet">
<link href="${contextPaht }/resources/css/chat-style.css" rel="stylesheet">
<style>
.chatting-area{
      margin :auto;
      height : 600px;
      width : 800px;
      margin-top : 50px;
      margin-bottom : 500px;
   }
   #exit-area{
      text-align:right;
      margin-bottom : 10px;
   }
   .display-chatting {
      width:42%;
      height:450px;
      border : 1px solid gold;
      overflow: auto; /*스크롤 처럼*/
      list-style:none;
      padding: 10px 10px;
      background : lightblue;
      z-index: 1;
          margin: auto;
      background-image : url(${contextPath}/resources/main/chunsickbackground.png);
       background-position: center;
   }
   .img {
      width:100%;
      height:100%;
       position: relative;
       z-index:-100;
   }
   .chat{
      display : inline-block;
      border-radius : 5px;
      padding : 5px;
      background-color : #eee;
   }
   .input-area{
      width:100%;
      display:flex;
      justify-content: center;
   }
   #inputChatting{
      width: 32%;
      resize : none;
   }
   #send{
      width:20%;
   }
   .myChat{
      text-align: right;
   }
   .myChat > p {
      background-color : gold;
   }
   .chatDate{
      font-size : 10px;
   }
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
		<div class="chatting-area">
         <div id="exit-area">
            <button class="btn btn-outline-danger" id="exit-btn">나가기</button>
         </div>
         <ul class="display-chatting">
            <li class="myChat">
               <span class="chatDate">2023년 08월 10일 14:14:30</span>
               <p class="chat">안녕!</p>
            </li>
            
            <li>
               <b>상대방</b>
               <p class="chat">반가워</p>
               <span class="chatDate">2023년 08월 10일 14:15:30</span>   
            </li>
            <li class="myChat">
               <span class="chatDate">2023년 08월 10일 14:14:30</span>
               <p class="chat">안녕!</p>
            </li>
            
            <li>
               <b>상대방</b>
               <p class="chat">반가워</p>
               <span class="chatDate">2023년 08월 10일 14:15:30</span>   
            </li>
            <li class="myChat">
               <span class="chatDate">2023년 08월 10일 14:14:30</span>
               <p class="chat">안녕!</p>
            </li>
            
            <li>
               <b>상대방</b>
               <p class="chat">반가워</p>
               <span class="chatDate">2023년 08월 10일 14:15:30</span>   
            </li>
            <li class="myChat">
               <span class="chatDate">2023년 08월 10일 14:14:30</span>
               <p class="chat">안녕!</p>
            </li>
            
            <li>
               <b>상대방</b>
               <p class="chat">반가워</p>
               <span class="chatDate">2023년 08월 10일 14:15:30</span>   
            </li>
         </ul>
         
         <div class="input-area">
            <textarea id="inputChatting" row="3"></textarea>
            <button id="send">보내기</button>
         </div>
         
      </div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>