package action;

import dao.BoardDAO;
import util.Common;
import util.Paging;
import vo.BoardVO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@WebServlet(name = "BoardListAction", value = "/board_list.do")
public class BoardListAction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        // board_list.do?page=2
        // board_list.do?
        // board_list.do?page=
        BoardDAO dao = BoardDAO.getInstance();

        String pageURL = "board_list.do";
        int nowPage = 1;
        String page = request.getParameter("page");
        if (page != null && !page.isEmpty()) {
            nowPage = Integer.parseInt(page);
        }

        int start = (nowPage - 1) * Common.Board.BLOCKLIST + 1;
        int end = start + Common.Board.BLOCKLIST - 1;

        HashMap<String, Object> map = new HashMap<>();
        map.put("start", start);
        map.put("end", end);

        // 검색 처리
        String search = request.getParameter("search");
        String search_text = request.getParameter("search_text");
        if (search != null && !search.equalsIgnoreCase("all")) {
            switch (search) {
                case "subject_name_content":
                    map.put("subject", search_text);
                    map.put("name", search_text);
                    map.put("content", search_text);
                    break;
                case "subject":
                    map.put("subject", search_text);
                    break;
                case "name":
                    map.put("name", search_text);
                    break;
                case "content":
                    map.put("content", search_text);
                    break;
            } // switch
        } // if

        List<BoardVO> board_list = null;
        board_list = dao.selectList(map);

        int rowTotal = dao.getRowTotal(map);

        String searchParam = String.format("search=%s&search_text=%s", search, search_text);

        // 페이징 처리 sb
        String sb = Paging.getPaging(pageURL, nowPage, rowTotal, searchParam, Common.Board.BLOCKLIST, Common.Board.BLOCKPAGE);
        request.setAttribute("sb", sb);


        // 조회수 세션 체크 해제
        request.getSession().removeAttribute("check");

        request.setAttribute("board_list", board_list);
        RequestDispatcher disp = request.getRequestDispatcher("board_list.jsp");
        disp.forward(request, response);
    } // end of service
} // end of class
