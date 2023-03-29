<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>board_insert_form.jsp</title>

    <script>
        function send(f){
            // 유효성 검사
            let subject = f.subject.value;
            let content = f.content.value;
            let name = f.name.value;
            let pwd = f.pwd.value;

            if(subject == ""){
                alert("제목을 입력하세요.");
                f.subject.focus();
                return;
            }
            if(content == ""){
                alert("내용을 입력하세요.");
                f.content.focus();
                return;
            }
            if(name == ""){
                alert("이름을 입력하세요.")
                f.name.focus();
                return;
            }
            if(pwd == ""){
                alert("비밀번호를 입력하세요.")
                f.pwd.focus();
                return;
            }

            f.method = "post";
            f.submit();
        } // end of send()
    </script>
</head>
<body>
<form action="board_insert.do">
    <table border="1" style="margin: 5px auto;">
        <caption>:::내용 작성:::</caption>
        <tr>
            <th>제목</th>
            <td><input type="text" name="subject"></td>
        </tr>
        <tr>
            <th>내용</th>
            <td><textarea name="content" cols="30" rows="10"></textarea></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                작성자 : <input type="text" name="name"> / 비밀번호 : <input type="password" name="pwd">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="button" value="등록" onclick="send(this.form)">
                <input type="button" value="이전" onclick="history.go(-1)">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
