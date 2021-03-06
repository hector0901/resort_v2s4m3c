<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 글만 조회하는 경우 참고  --%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>리뷰 조회</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>

<body>
<c:set var="review_cate_no" value="${review_CateVO.review_cate_no}" />
<c:set var="review_no" value="${reviewVO.review_no }" />

<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class='title_line'>
    ${review_CateVO.review_cate_name }
  </DIV>
  
  <ASIDE class="aside_left">
    ${review_CategrpVO.review_categrp_name } > ${review_CateVO.review_cate_name }
  </ASIDE>
  <ASIDE class="aside_right">
    <A href="./create.do">글 등록</A>
    <%-- <span class='menu_divide' > | </span>
    <A href='../attachfile/create.do?contentsno=${contentsno }&cateno=${cateno }'>첨부 파일 등록</A> --%>
    <span class='menu_divide' > | </span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./list.do?review_cate_no=${review_cate_no }'>목록</A>
    <span class='menu_divide' > | </span> 
    <A href='./update.do?review_cate_no=${review_cate_no }&review_no=${review_no}'>수정</A>
    <span class='menu_divide' > | </span> 
    <A href='./delete.do?review_cate_no=${review_cate_no }&review_no=${review_no}'>삭제</A>
    
  </ASIDE> 
  
  <div class='menu_line'></div>

  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="review_no" value="${review_no}">
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span>${reviewVO.review_title}</span>
            (<span>${reviewVO.review_good}</span>)
            <span>${reviewVO.review_date.substring(0, 16)}</span>
          </li>
            
          <li class="li_none">
            <DIV>${reviewVO.review_content }</DIV>
          </li>
          <li class="li_none">
            <DIV style='text-decoration: none;'>
              검색어(키워드): ${contentsVO.review_word }
            </DIV>
          </li>
        </ul>
      </fieldset>
  </FORM>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>

