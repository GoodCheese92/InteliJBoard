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
    <title>board_view.jsp</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="js/bootstrap.js"></script>
    <script src="js/httpRequest.js"></script>
    <script>
        function send(f) {
            f.method = "get";
            f.submit();
        } // end of send()

        // Ajax 써서 삭제해보기
        function del() {
            if (!confirm("정말 삭제하시겠습니까?")) {
                return;
            }

            var url = "board_del.do";
            var param = "idx=${vo.idx}";

            sendRequest(url, param, resultFn, "GET");

        } // end of del()

        function resultFn() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                var data = xhr.responseText;
                if (data == 1) {
                    alert("삭제성공");
                } else {
                    alert("삭제실패");
                }
                location.href = "board_list.do?page=${param.page}";
            }
        } // end of resultFn()
    </script>
</head>
<body>
<div class="row">
    <div class="col-3"></div>
    <div class="col-6">
        <table border="1" class="table table-bordered border-dark caption-top">
            <caption class="fw-bold fs-1 text-center text-primary">:::내용 작성:::</caption>
            <tr>
                <th class="fw-bold">제목</th>
                <td>${vo.subject}</td>
            </tr>
            <tr>
                <th class="fw-bold">내용</th>
                <td>
                    <pre>${vo.content}</pre>
                </td>
            </tr>
            <tr>
                <th class="fw-bold">작성일</th>
                <td>${vo.regidate}</td>
            </tr>
            <tr>
                <th class="fw-bold">ip</th>
                <td>${vo.ip}</td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    작성자 : ${vo.name} / 비밀번호 : ${vo.pwd}
                </td>
            </tr>
            <tr>
                    <td colspan="2" >
                        <div class="input-group">
                        <input type="button" class="btn btn-warning" value="목록으로 돌아가기"
                               onclick="location.href='board_list.do?page=${param.page}'">
                        <form action="board_reply.jsp">
                            <input type="button" class="btn btn-success" value="답변" onclick="send(this.form);">
                            <input type="hidden" value="${vo.idx}" name="idx">
                            <input type="hidden" value="${param.page}" name="page">
                        </form>
                        <input type="button" class="btn btn-danger" value="삭제" onclick="del();">
                        </div>
                    </td>

            </tr>
        </table>
    </div>
    <div class="col-3"></div>
</div>
</body>
</html>
