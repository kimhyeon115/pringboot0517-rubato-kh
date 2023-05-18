<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" type="text/css" href="/resources/css/board_write_main.css">
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
        <div id="write_title"><h2>글쓰기</h2></div>
        <form action="board_writeOk" method="post" enctype="multipart/form-data">
	        <table>
	          <tr id="name">
	            <td class="col1">이름</td>
	            <td class="col2"><input type="text" name="bname"></td>
	          </tr>
	          <tr id="subject">
	            <td class="col1">제목</td>
	            <td class="col2"><input type="text" name="btitle"></td>
	          </tr>
	          <tr id="content">
	            <td class="col1">내용</td>
	            <td class="col2"><textarea name="bcontent"></textarea></td>
	          </tr>
	          <tr id="upload">
	            <td class="col1">업로드 파일</td>
	            <td class="col2"><input type="file" name="files"></td>
	          </tr>
	        </table>
	        <div id="buttons">
	          <input type="image" src="/resources/img/ok.png">	          
	          <a href="board_list"><img src="/resources/img/list.png"></a>
	        </div>
        </form>
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