<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html xmlns:th="http://wwww.thymeleaf.org">
  <head>
    <meta http-http-equiv="Content-Type" content="text/thml; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../favicon.ico">
	<link type="text/css" rel="stylesheet" href="/TheLostItemFinder/css/board.css">
    <title>물건을 찾아줘</title>
	<jsp:include page="/WEB-INF/views/default.jsp" flush="false"/>	
	<script src="/TheLostItemFinder/js/board.js"></script>
	<script>
	$(function () {
	    $('[data-toggle="popover"]').popover()
	    })
	$(function () {
	    $('[data-toggle="dropdown"]').dropdown()
	    })    
	</script>
  </head>

  <body>

    <div class="container">
	 <jsp:include page="/WEB-INF/views/header.jsp" flush="false"/>
	 
      <!-- Main component for a primary marketing message or call to action -->

      <div class="row">
        <div class="col-xs-6 col-md-2" >
          <p></p>
			
          </div>
          <div class="col-xs-12 col-md-10">
            <div class="page-header">
              <h1>분실물 알림</h1>
            </div>
			<c:if test="${isArticle eq true}">
			<div>
			<c:choose>
            	<c:when test="${article.HOLD eq 'GIVEBACK'}">
			 		<table class="table given-item text-center">
				</c:when>
				<c:when test="${article.HOLD ne 'GIVEBACK'}">
			 		<table class="table text-center">
				</c:when>
			</c:choose>
			  <tr>
			    <th colspan="4" class="header-style" style="text-align:center;">[${article.TYPE_ARTICLE}]<font id="title">${article.TITLE}</font></th>
			  </tr>
			  <tr>
				<td colspan="2" style="text-align:center;">${article.NICKNAME}</td><td colspan="1" style="text-align:center;"> <font id="date">${article.DATE_UPLOAD} 작성</font> </td><td style="text-align:right;">조회수 ${article.HITS }</td>
			  </tr>
			  <tr>
				<td style="text-align:center; width:15%">잃어버린 장소 </td><td style="text-align:left;"> ${article.PLACE} </td>
				<td style="text-align:center; width:15%">잃어버린 / 찾은 날 </td><td style="text-align:left;"> ${article.DATE_LOST} </td>
			  </tr>
			  <tr>
			  	<c:if test="${article.HOLD eq 'NONE'}">
				<td style="text-align:center; width:15%">분실물 종류</td><td colspan="3" style="text-align:left; width:50%">${article.TYPE_ITEM}</td>
				</c:if>
			  	<c:if test="${article.HOLD ne 'NONE'}">
				<td style="text-align:center; width:15%">분실물 종류</td><td style="text-align:left; width:35%">${article.TYPE_ITEM}</td>
				<td style="text-align:center; width:15%">보관중인 관리실</td><td style="text-align:left; width:35%">${article.OFFICE}
				<button id="infoOffice" class="glyphicon glyphicon-info-sign" style="border:none; backgorund-color:#FFFFFF;" data-toggle="popover" data-placement="right" title="${infoOffice.NAME}" data-html="true" data-content="관리실 번호 - ${infoOffice.TEL} <br> 위치 - ${infoOffice.LOCATION}"></button></td>
				</c:if>
			  </tr>
			  <tr>
				<td colspan="4" style="text-align:left; height:200px" >
				${article.CONTENTS}</td>
			  </tr>
			 </table>
			</div>
			<div>
			 <table class="table text-center">
			  <tr class="header-style" style="width:100%">
			   <th style="text-align:center; width:8%;">댓글번호</th><th style="text-align:center; width:65%">내용</th><th style="text-align:center; width:10%">작성자</th><th style="text-align:center; width:17%">작성일</th>
			  </tr>
			  <c:choose>
			   <c:when test="${not empty replies}">
			    <c:forEach var="reply" items="${replies}">
			     <c:choose>
			      <c:when test="${sessionScope.user.NICKNAME eq reply.NICKNAME}">
			       <tr>
			        <td>${reply.REPLY_SEQ}</td><td>${reply.CONTENTS}&nbsp;<a href="#" onclick="delRep(${reply.REPLY_SEQ},${reply.ARTICLE_SEQ})"><span class="glyphicon glyphicon-remove"></span></a></td><td>${reply.NICKNAME}</td><td>${reply.DATE}</td>
			       </tr>
			      </c:when>
			      <c:when test="${sessionScope.user.NICKNAME ne reply.NICKNAME}">
			       <tr>
			        <td>${reply.REPLY_SEQ}</td><td>${reply.CONTENTS}</td><td>${reply.NICKNAME}</td><td>${reply.DATE}</td>
			       </tr>
			      </c:when>
			     </c:choose>
			    </c:forEach>
			   </c:when>
			   <c:when test ="${empty replies}">
			    <tr>
			  	 <td colspan="4">작성한 댓글이 없습니다.</td>
			  	</tr>
			   </c:when>
			  </c:choose>
			  <tr class="table-hover">
			   <c:choose>
                <c:when test="${not empty sessionScope.user}">
                 <form action="board" method="POST">
			      <input type="hidden" name="id" value="${article.SEQ}">
			      <input type="hidden" name="nickname" value="${sessionScope.user.NICKNAME}"> 
			      <td colspan="3">
			       <textarea style="width:100%; height:100%" rows="4" onkeyup="counter(this,1500)" name="contents"></textarea>
			       <div style="text-align:right;">
			        <span id="reCount">0 / 1500</span>
			       </div>
			      </td>
			      <td>
			   	   <input class="btn btn-success" style="width:100%; height:100%;" type="submit" value="댓글 작성">
			      </td>
			     </form>
                </c:when>
                <c:when test="${empty sessionScope.user}">
                </c:when>
               </c:choose> 
			   </tr>
			 </table>
			<div>
			 <c:choose>
			  <c:when test="${sessionScope.user.GRADE eq 'ADMIN'}" >
			  <c:if test="${article.HOLD eq 'NONE'}">
			   <button class="btn btn-default" onclick="store(${article.SEQ})">보관하기</button>
			  </c:if>
			  <c:if test="${article.HOLD eq 'HOLD' and article.OFFICE_SEQ eq sessionScope.user.OFFICE_SEQ}"> 
			   <button class="btn btn-default" onclick="cancel(${article.SEQ})">보관취소</button>
			  </c:if>
			   <button class="btn btn-warning" onclick="free(${article.SEQ})">삭제</button>
			  </c:when>
			  <c:when test="${empty sessionScope.user or article.NICKNAME ne sessionScope.user.NICKNAME}">
			   <button class="btn btn-default">신고</button>
			  </c:when>
			  <c:when test="${article.NICKNAME eq sessionScope.user.NICKNAME}" >
			   <button class="btn btn-default">수정</button> <button class="btn btn-warning" onclick="javascript:free(${article.SEQ})">삭제</button>
			  </c:when>
			 </c:choose>
			</div>
			</div>
			
			</c:if>
            <!-- Single button -->
            <div  style="text-align:right">
              <div class="btn-group " >
                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                  보기 <span class="caret"></span>
                </button>
                <input type="hidden" id="limit" name="limit" value="${limit}">
                <ul class="dropdown-menu" role="menu">
                  <li><a href="#">최신순</a></li>
                  <li><a href="#">주인찾는글만 보기</a></li>
                  <li><a href="#">물건찾는글만 보기</a></li>
                  <li class="divider"></li>
                  <li><a onclick="divide(5)">5개씩 보기</a></li>
                  <li><a onclick="divide(10)">10개씩 보기</a></li>
                  <li><a onclick="divide(15)">15개씩 보기</a></li>
                </ul>
              </div>
            </div>
            <p></p>
            <table class="table table-hover text-center">
              <tr class="header-style">
                <th style="width:7%; text-align:center; color:#FFFFFF;"><b>글 번호</b></th>
                <th style="width:21%; text-align:center; color:#FFFFFF;"><b>물건 사진</b></th>
                <th style="width:30%; text-align:center; color:#FFFFFF;"><b>제목</b></th>
                <th style="width:15%; text-align:center; color:#FFFFFF;"><b>물건 종류</b></th>
                <th style="width:10%; text-align:center; color:#FFFFFF;"><b>글쓴이</b></th>
                <th style="width:7%; text-align:center; color:#FFFFFF;"><b>조회수</b></th>
                <th style="width:10%; text-align:center; color:#FFFFFF;"><b>업로드 날짜</b></th>
              </tr>
              <c:forEach var="article" items="${list}">
              <tr>
                <td style="text-align:center">${article.SEQ}</td>
                <td><img src="${article.IMAGE}" alt="클릭하면 게시물로 이동합니다." width="40%"></td>
                <td><a href="?id=${article.SEQ}">[${article.TYPE_ARTICLE}]${article.TITLE}</a>
                <c:if test="${article.HOLD eq 'GIVEBACK'}">
                	<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                </c:if></td>
                <td>${article.TYPE_ITEM}</td>
                <td>${article.NICKNAME}</td>
                <td>${article.HITS}</td>
                <td>${article.DATE_UPLOAD}</td>
              </tr>
              </c:forEach>
            </table>
          </div>
        </div>
		
		<input type="hidden" id="page" value="${page}">
        <nav style="text-align:center">
          <ul id="pages" class="pagination pagination-sm">

          </ul>
        </nav>
      
      <!-- 그림 이미지 버튼입니다 -->
      <div class="container" style="text-align:center">
        <form class="form-inline" method="GET" action="board">
          <c:if test="${not empty article.SEQ}">
          	<input type="hidden" id="articleNum2" value="${article.SEQ}" name="id">
          </c:if>
          <div class="form-group">
            <div class="btn-group">
              <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                	선택<span class="caret"></span>
              </button>
              <ul class="dropdown-menu" role="menu">
                <li><a onclick="setCondition('Title')">제목</a></li>
                <li><a onclick="setCondition('TitleContext')">제목 + 내용</a></li>
                <li><a onclick="setCondition('Type')">물건 종류</a></li>
                <li><a onclick="setCondition('Place')">장소</a></li>
              </ul>
            </div>
            <div class="btn-group">
              <input type="text" id="searchField" class="form-control" name="search" placeholder="검색어를 입력하세요.">
              <input type="hidden" id="searchType" name="searchType" value="Title">
            </div>
            <button type="submit" class="btn btn-default">검색</button>
          </div>
        </form>
        <c:if test="${not empty sessionScope.user}">
	        <div style="text-align:right">
	        	<button class="btn btn-default" onclick="javascript:location.href='upload'">글쓰기 </button>
	        </div>
        </c:if>
        <div id="warning"></div>
      </div>
	 
      <div class="page-header">
      </div>

      <div class="text-center">
        하단 글
      </div>
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/TheLostItemFinder/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/TheLostItemFinder/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
