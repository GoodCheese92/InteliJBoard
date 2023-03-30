package action;

import dao.BoardDAO;
import vo.BoardVO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "BoardReplyAction", value = "/board_reply.do")
public class BoardReplyAction extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        BoardDAO dao = BoardDAO.getInstance();
        // 본문을 idx를 이용해서 selectOne()을 통해 본문 정보 불러옴
        int idx = Integer.parseInt(request.getParameter("idx"));
        BoardVO baseVO = dao.selectOne(idx);

        dao.update_step(baseVO);

        // 댓글에 작성한 내용 불러오기
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");
        String name = request.getParameter("name");
        String pwd = request.getParameter("pwd");
        int ref = baseVO.getRef();
        String ip = request.getRemoteAddr();
        int step = baseVO.getStep() + 1;
        int depth = baseVO.getDepth() + 1;

        BoardVO vo = new BoardVO();
        vo.setSubject(subject);
        vo.setContent(content);
        vo.setName(name);
        vo.setPwd(pwd);
        vo.setRef(ref);
        vo.setIp(ip);
        vo.setStep(step);
        vo.setDepth(depth);

        int res = BoardDAO.getInstance().insert_reply(vo);
        if(res == 1){
            response.sendRedirect("board_list.do");
        }

    } // end of service()
} // end of class
