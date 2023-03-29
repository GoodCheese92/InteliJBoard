package action;

import dao.BoardDAO;
import vo.BoardVO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "BoardInsertAction", value = "/board_insert.do")
public class BoardInsertAction extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String subject = request.getParameter("subject");
        String content = request.getParameter("content");
        String name = request.getParameter("name");
        String pwd = request.getParameter("pwd");
        String ip = request.getRemoteAddr();

        BoardVO vo = new BoardVO();
        vo.setSubject(subject);
        vo.setContent(content);
        vo.setName(name);
        vo.setPwd(pwd);
        vo.setIp(ip);

        int res = BoardDAO.getInstance().insert(vo);

        if(res == 1){
            response.sendRedirect("board_list.do");
        }

    } // end of service()

} // end of class
