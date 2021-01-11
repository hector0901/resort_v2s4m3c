<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 30px;}
</style>
</head>
<body>
<DIV class='container'>
<DIV class='content'>

<%
 request.setAttribute("product", new String[]{"상품명A", "상품명B", "상품명C"});
 %>
 
<c:forEach var="item" items="${product }" varStatus="info">
  <c:set var="img" value="<IMG src='./images/bu6.png'>" />
    ${img } ${item }<br>
</c:forEach>

</DIV> 
</DIV> 
</body>
</html>

