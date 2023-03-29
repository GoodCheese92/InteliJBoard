<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
    <table border="1" style="margin: 5px auto;">
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
                <td><a href="board_view.do?idx=${vo.idx}">${vo.subject}</a></td>
                <td>${vo.name}</td>
                <td>${vo.regidate}</td>
                <td>${vo.readhit}</td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="5" style="text-align: center">
                ◀ 1 2 3 ▶
            </td>
        </tr>
        <tr>
            <td colspan="5" style="text-align: right">
                <input type="button" value="등록" onclick="location.href='board_insert_form.jsp'">
            </td>
        </tr>

    </table>
    </body>
</html>


























