<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>board_list.jsp</title>
    <link rel="stylesheet" href="css/bootstrap.css">

    <script>
        function search() {
            let search = document.getElementById("search").value;
            let search_text = document.getElementById("search_text").value;

            if (search != "all" && search_text.trim() == "") {
                alert("검색어를 입력하세요");
                return;
            }

            location.href = "board_list.do?search=" + search + "&search_text=" + encodeURIComponent(search_text);

        } // end of search()
    </script>
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
            <td>
                <c:if test="${vo.depth ne 0}">└</c:if>
                <c:if test="${vo.del_info ne -1}">
                    <c:forEach begin="1" end="${vo.depth}">&nbsp;</c:forEach>
                    <a href="board_view.do?idx=${vo.idx}&page=${param.page}">
                            ${vo.subject}</a>
                </c:if>
                <c:if test="${vo.del_info eq -1}">
                    <font color="gray">삭제된 글입니다.</font>
                </c:if>

            </td>
            <td>${vo.name}</td>
            <td>${vo.regidate}</td>
            <td>${vo.readhit}</td>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="5" style="text-align: center">
            ${ sb }
        </td>

    </tr>
    <tr>
        <td colspan="4">
            <select id="search">
                <option value="all">전체보기</option>
                <option value="subject">제목</option>
                <option value="name">이름</option>
                <option value="content">내용</option>
                <option value="subject_name_content">제목+이름_내용</option>
            </select>
            <input type="text" id="search_text">
            <input type="button" value="검색" onclick="search();">
        </td>
        <td colspan="1" style="text-align: right">
            <input type="button" value="등록" onclick="location.href='board_insert_form.jsp'">
        </td>
    </tr>

</table>
<script src="js/bootstrap.js"></script>
</body>
</html>
