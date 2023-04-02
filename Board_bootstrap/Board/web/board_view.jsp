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
    <script src="js/httpRequest.js"></script>
    <script>
        function send(f){
            f.method = "get";
            f.submit();
        } // end of send()

        // Ajax 써서 삭제해보기
        function del(){
            if(!confirm("정말 삭제하시겠습니까?")){
                return;
            }

            var url = "board_del.do";
            var param = "idx=${vo.idx}";

            sendRequest(url, param, resultFn, "GET");

        } // end of del()

        function resultFn(){
            if(xhr.readyState == 4 && xhr.status == 200){
                var data = xhr.responseText;
                if(data == 1){
                    alert("삭제성공");
                } else{
                    alert("삭제실패");
                }
                location.href="board_list.do?page=${param.page}";
            }
        } // end of resultFn()
    </script>
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
            <input type="button" value="목록으로 돌아가기" onclick="location.href='board_list.do?page=${param.page}'">
            <form action="board_reply.jsp">
                <input type="button" value="답변" onclick="send(this.form);">
                <input type="hidden" value="${vo.idx}" name="idx">
                <input type="hidden" value="${param.page}" name="page">
            </form>
            <input type="button" value="삭제" onclick="del();">
        </td>
    </tr>
</table>
</body>
</html>
