<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
    <table>
        <caption>:::게시판 목록:::</caption>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일시</th>
            <th>조회수</th>
        </tr>
        <c:forEach var="vo" items="${board_list}">
            <tr>
                <td>${vo.idx}</td>
                <td>${vo.subject}</td>
                <td>${vo.name}</td>
                <td>${vo.regidate}</td>
                <td>${vo.readhit}</td>
            </tr>
        </c:forEach>

    </table>
    </body>
</html>
