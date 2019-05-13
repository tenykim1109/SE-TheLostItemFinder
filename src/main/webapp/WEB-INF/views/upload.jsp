<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html xmlns:th="http://wwww.thymeleaf.org">
  <head>
    <meta http-http-equiv="Content-Type" content="text/thml; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../favicon.ico">

    <title>물건을 찾아줘</title>

    <!-- Bootstrap core CSS -->
    <link href="/TheLostItemFinder/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/TheLostItemFinder/css/main/navbar.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/TheLostItemFinder/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style>
    	.inputtext{width:100%;}
    </style>
  </head>

  <body>

    <div class="container">

      <!-- Static navbar -->
      <nav class="navbar navbar-inverse">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/TheLostItemFinder/">물건을 찾아줘</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li><a href="board">들어온 분실물 </a></li>
              <li><a href="upload">내 분실물 알리기</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">추가개발예정 <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="#">Action</a></li>
                  <li><a href="#">Another action</a></li>
                  <li><a href="#">Something else here</a></li>
                  <li class="divider"></li>
                  <li class="dropdown-header">Nav header</li>
                  <li><a href="#">Separated link</a></li>
                  <li><a href="#">One more separated link</a></li>
                </ul>
              </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li><a href="../navbar-fixed-top/">로그인 <span class="sr-only">(current)</span></a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
          <img width="100%" height="80%" src="../site-image/background-image1.jpg"/>
      </nav>

      <!-- Main component for a primary marketing message or call to action -->

      <div class="row">
        <div class="col-xs-6 col-md-2">
          <p></p>
          <div class="panel panel-success" style="margin-top:30%" >
            <!-- Default panel contents -->
            <div class="panel-heading">Menu
            </div>
            <div class="list-group">
              <a href="#" class="list-group-item active">
                게시물 작성하기
              </a>
              <a href="#" class="list-group-item">게시물 수정하기</a>
              <a href="#" class="list-group-item">게시물 삭제하기</a>
              <a href="#" class="list-group-item">관리자에게 알리기</a>
              <a href="#" class="list-group-item">추가개발예정</a>
            </div>
          </div>

        </div>
        <div class="col-xs-12 col-md-10">
          <div class="page-header">
            <h1>게시물 작성</h1>
          </div>
			<form method="POST" action="upload">
	          <table class="table">
	          	<tr>
	            	<td><input class="inputtext" type="text" name="title" placeholder="제목을 입력하세요"></td>
	            </tr>
	            <tr>
	            	<td><input class="inputtext" type="text" name="place" placeholder="잃어버린 장소를 입력하세요"></td>
	            </tr>
	            <tr>
	            	<td><input class="inputtext" type="text" name="type_item" placeholder="분실물 종류를 입력하세요"></td>
	            </tr>
				<tr>
					<td><textarea class="inputtext" type="text" name="contents" placeholder="내용을 입력하세요"> </textarea></td>
				</tr>
	          </table>
	          <!-- Single button -->
	          <div  style="text-align:right;">
							<input type="submit" value="작성완료"/>
						</form>

		      <div class="page-header">
		      </div>

		      <div class="text-center">
		        하단 문구 작성
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
