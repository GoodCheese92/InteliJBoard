package action;

import dao.BoardDAO;
import vo.BoardVO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "BoardViewAction", value = "/board_view.do")
public class BoardViewAction extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // board_view.do?idx=3
        int idx = Integer.parseInt(request.getParameter("idx"));
        BoardVO vo = BoardDAO.getInstance().selectOne(idx);

        // 조회수 관리
        HttpSession session = request.getSession();
        String check = (String)session.getAttribute("check");
        if(check==null){
            BoardDAO.getInstance().update_readhit(idx);
            session.setAttribute("check", "");
        }

        request.setAttribute("vo", vo);

        RequestDispatcher disp = request.getRequestDispatcher("board_view.jsp");
        disp.forward(request, response);

    } // end of service
} // end of class
