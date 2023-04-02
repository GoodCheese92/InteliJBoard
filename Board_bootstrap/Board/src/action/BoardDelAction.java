package action;

import dao.BoardDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "BoardDelAction", value = "/board_del.do")
public class BoardDelAction extends HttpServlet {
    @Override 
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // board_del.do?idx=86
        int idx = Integer.parseInt(request.getParameter("idx"));
        int res = BoardDAO.getInstance().update_delInfo(idx);

        if(res == 1){
            response.getWriter().print(res);
        }

    } // end of service

} // end of class
