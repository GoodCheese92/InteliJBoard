<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>board_list.jsp</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <style>
        a{text-decoration: none;}
    </style>
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
<div class="row">
    <div class="col-2">

    </div>
    <div class="col-8">
        <table border="1" class="table table-bordered border-success table-hover caption-top">
            <caption class="fs-1 fw-bold text-center text-primary">:::게시판 목록:::</caption>
            <thead>
            <tr class="text-center text-success fw-bold">
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일시</th>
                <th>조회수</th>
            </tr>
            </thead>
            <c:forEach var="vo" items="${board_list}">
            <tr>
                <td class="text-center">${vo.idx}</td>
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
                <td class="text-center">${vo.name}</td>
                <td class="text-center">${vo.regidate}</td>
                <td class="text-center">${vo.readhit}</td>
            </tr>
            </c:forEach>
            <tr>
                <td colspan="5" style="text-align: center">
                    ${ sb }
                </td>

            </tr>
            <tr>
                <td colspan="4">
                    <div class="input-group">
                    <select id="search">
                        <option value="all">전체보기</option>
                        <option value="subject">제목</option>
                        <option value="name">이름</option>
                        <option value="content">내용</option>
                        <option value="subject_name_content">제목+이름_내용</option>
                    </select>
                    <input type="text" id="search_text">
                    <input type="button" class="btn btn-dark" value="검색" onclick="search();">
                    </div>
                </td>
                <td colspan="1" style="text-align: right">
                    <input type="button" class="btn btn-dark" value="등록" onclick="location.href='board_insert_form.jsp'">
                </td>
            </tr>
        </table>
    </div>
    <div class="col-2">

    </div>
</div>
<script src="js/bootstrap.js"></script>
</body>
</html>
