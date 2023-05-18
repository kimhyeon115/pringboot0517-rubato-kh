<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link rel="stylesheet" type="text/css" href="/resources/css/board_list_main.css">
</head>
<body>
  <div id="wrap">
    <header> <!-- header 시작 -->
      <a href="index."><img id="logo" src="/resources/img/logo.png"></a>
      <nav id="top_menu">
        HOME | LOGIN | JOIN | NOTICE
      </nav>
      <nav id="main_menu">
        <ul>
          <li><a href="board_list.">자유게시판</a></li>
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
        <div id="total_search">
          <div id="total">▷ 총 ${totalCount}개의 게시물이 있습니다.</div>
          <form action="search_list">
          <div id="search">
            <div id="select_img"><img src="/resources/img/select_search.gif"></div>
            <div id="search_select">
              <select name="searchOption">
                <option value="title">제목</option>
                <option value="content">내용</option>
                <option value="writer">글쓴이</option>
              </select>
            </div>
            <div id="search_input"><input type="text" name="keyword"></div>
            <div id="search_btn">
            	<input type="image" src="/resources/img/search_button.gif">
            </div>
          </div>
          </form>
        </div> <!-- total search 끝 -->
        <table>
          <tr>
            <th>번호</th>
            <th>제목</th>
            <th>글쓴이</th>
            <th>일시</th>
            <th>조회수</th>
          </tr>                    
          <c:forEach items="${list}" var="dto">
          <tr>
          	<td class="col1">${dto.bnum}</td>
          	<td class="col2">
          		<a href="board_view?bnum=${dto.bnum}">${dto.btitle}</a>
          		<c:if test="${dto.breplycount != 0}">&nbsp;&nbsp;&nbsp;&nbsp;
          		<span style="color:#999999"; font-size: 8px;>[${dto.breplycount}]</span>
          		</c:if>
          		<c:if test="${dto.bfilecount != 0}">
          			<img width="15" src="/resources/img/fileimg.png">
          		</c:if>
          		</td>
          	<td class="col3">${dto.bname}</td>
          	<td class="col4"><c:out value="${fn:substring(dto.bdate,0,10)}"></c:out></td>
          	<td class="col5">${dto.bhit}</td>
          </tr>	
          </c:forEach>
        </table> <!-- 게시판 목록 테이블 끝 -->
        <div id="buttons">
          <div class="col1">◀ 이전 1 다음 ▶</div>
          <div class="col2">
            <img src="/resources/img/list.png">
            <a href="board_write"><img src="/resources/img/write.png"></a>
          </div>
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