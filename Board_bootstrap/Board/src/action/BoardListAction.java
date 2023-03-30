package action;

import dao.BoardDAO;
import vo.BoardVO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BoardListAction", value = "/board_list.do")
public class BoardListAction extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<BoardVO> board_list = BoardDAO.getInstance().selectList();

        // 조회수 세션 체크 해제
        request.getSession().removeAttribute("check");

        request.setAttribute("board_list", board_list);
        RequestDispatcher disp = request.getRequestDispatcher("board_list.jsp");
        disp.forward(request, response);
    } // end of service
} // end of class
