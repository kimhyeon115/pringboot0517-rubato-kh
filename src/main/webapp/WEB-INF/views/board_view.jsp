<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>클래식기타 커뮤니티</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/common.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/header.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/main.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/board_left.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/board_view_main.css">
</head>
<body>
  <div id="wrap">
    <header> <!-- header 시작 -->
      <a href="index"><img id="logo" src="/resources/img/logo.png"></a>
      <nav id="top_menu">
        HOME | LOGIN | JOIN | NOTICE
      </nav>
      <nav id="main_menu">
        <ul>
          <li><a href="board_list">자유게시판</a></li>
          <li><a href="#">기타 연주</a></li>
          <li><a href="#">공동 구매</a></li>
          <li><a href="#">연주회 안내</a></li>
          <li><a href="#">회원 게시판</a></li>
        </ul>
      </nav>
    </header> <!-- header 끝 -->
    <aside>
      <article id="login_box"> <!-- login box 시작 -->
        <img id="login_title" src="/resources/img/ttl_login.png">
        <div id="input_button">
          <ul id="login_input">
            <li><input type="text"></li>
            <li><input type="password"></li>
          </ul>
          <img id="login_btn" src="/resources/img/btn_login.gif">
        </div>
        <div class="clear"></div>
        <div id="join_search">
          <img src="/resources/img/btn_join.gif">
          <img src="/resources/img/btn_search.gif">
        </div>
      </article> <!-- login box 끝 -->
      <nav id="sub_menu"> <!-- 서브 메뉴 시작 -->
        <ul>
          <li><a href="board_list">+ 자유 게시판</a></li>
          <li><a href="#">+ 방명록</a></li>
          <li><a href="#">+ 공지사항</a></li>
          <li><a href="#">+ 등업 요청</a></li>
          <li><a href="#">+ 포토갤러리</a></li>
        </ul>
      </nav> <!-- 서브 메뉴 끝 -->
      <article id="sub_banner">
        <ul>
          <li><img src="/resources/img/banner1.png"></li>
          <li><img src="/resources/img/banner2.png"></li>
          <li><img src="/resources/img/banner3.png"></li>
        </ul>
      </article>
    </aside>
    <main>
      <section id="main">
        <img src="/resources/img/comm.gif">
        <h2 id="board_title">자유게시판</h2>
        <div id="view_title_box">
          <span id="boardTitle">${boardDto.btitle}</span>
          <span id="info">${boardDto.bname} | 조회수 : ${boardDto.bhit} | ${boardDto.bdate}</span>
        </div>
        <p id="view_content">
          ${boardDto.bcontent}
        </p>
        
        <p id="file_info">
        	※ 첨부파일 :
        	<a href="/resources/uploadfiles/${fileDto.filename}" download>${fileDto.fileoriname}</a>        
        </p>
        <br>
        <c:if test="${fileDto.fileextension == 'jpg' or fileDto.fileextension == 'png' or fileDto.fileextension == 'gif' or fileDto.fileextension == 'bnp'}">
        	<br>
        		<img width="300" src="/resources/uploadfiles/${fileDto.filename}">
        	<br>
        </c:if>
        
        <table border="1" cellpadding="0" cellspacing="0" width="750">
        	<c:forEach items="${replyList}" var="replyDto">
        	<tr>
        		<td align="center">${replyDto.rid}</td>
        		<td width="60%">&nbsp;&nbsp;&nbsp;&nbsp;${replyDto.rcontent}</td>
        		<td align="center">${replyDto.rdate}</td>
        		<td align="center">
					<input type="button" value="삭제" onclick="script:window.location.href='replyDelete?rnum=${replyDto.rnum}&bnum=${boardDto.bnum}'">
				</td>
        	</tr>
        	</c:forEach>
        </table>
        <form action="reply_write" method="post">
        	<input type="hidden" name="rorinum" value="${boardDto.bnum}">
	        <div id="comment_box">
	          <img id="title_comment" src="/resources/img/title_comment.gif">
	          <textarea name="rcontent"></textarea>
	          <input type="image" src="/resources/img/ok_ripple.gif" id="ok_ripple">
	        </div>
        </form>
        <div id="buttons">
          <a href="boar_delete?bnum=${boardDto.bnum}"><img src="/resources/img/delete.png"></a>
          <a href="board_list"><img src="/resources/img/list"></a>
          <a href="board_write"><img src="/resources/img/write"></a>
        </div>
      </section> <!-- section main 끝 -->
    </main>
    <div class="clear"></div>
    <footer> <!-- footer 시작 -->
      <img id="footer_logo" src="/resources/img/footer_logo.gif">
      <ul id="address">
        <li>서울시 강남구 삼성동 1234 (우) : 123-1234</li>
        <li>TEL : 02-1234-1234 Email : abc@abc.com</li>
        <li id="copyright">COPYRIGHT(C) 루바토 ALL RIGHTS RESERVED</li>
      </ul>
      <ul id="footer_sns">
        <li><img src="/resources/img/facebook.gif"></li>
        <li><img src="/resources/img/blog.gif"></li>
        <li><img src="/resources/img/twitter.gif"></li>
      </ul>
    </footer> <!-- footer 끝 -->
  </div>
</body>
</html>