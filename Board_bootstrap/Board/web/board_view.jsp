<%--
  Created by IntelliJ IDEA.
  User: 이성진
  Date: 2023-03-29
  Time: PM 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table border="1" style="margin: 5px auto;">
    <caption>:::내용 작성:::</caption>
    <tr>
        <th>제목</th>
        <td>${vo.subject}</td>
    </tr>
    <tr>
        <th>내용</th>
        <td><pre>${vo.content}</pre></td>
    </tr>
    <tr>
        <th>작성일</th>
        <td>${vo.regidate}</td>
    </tr>
    <tr>
        <th>ip</th>
        <td>${vo.ip}</td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: center">
            작성자 : ${vo.name} / 비밀번호 : ${vo.pwd}
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input type="button" value="목록으로 돌아가기" onclick="location.href='board_list.do'">
            <input type="button" value="답변" onclick="">
            <input type="button" value="삭제" onclick="">
        </td>
    </tr>
</table>
</body>
</html>
