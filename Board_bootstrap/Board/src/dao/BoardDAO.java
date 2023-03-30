package dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import service.MyBatisConnector;
import vo.BoardVO;

import java.util.List;

public class BoardDAO {

    // single-ton pattern:
    // 객체1개만생성해서 지속적으로 서비스하자
    static BoardDAO single = null;
    public static BoardDAO getInstance() {
        // 생성되지 않았으면 생성
        if (single == null)
            single = new BoardDAO();
        // 생성된 객체정보를 반환
        return single;
    } // end of getInstance()

    SqlSessionFactory factory = null;

    private BoardDAO() {
        factory = MyBatisConnector.getInstance().getFactory();
    } // end of constructor

    public List<BoardVO> selectList(){
        SqlSession sqlSession = factory.openSession();
        List<BoardVO> board_list = sqlSession.selectList("b.board_list");
        sqlSession.close();
        // System.out.println("selectList() 잘 실행됨");
        return board_list;
    } // end of selectList()

    public int insert(BoardVO vo){
        SqlSession sqlSession = factory.openSession(true);
        int res = sqlSession.insert("b.board_insert", vo);
        sqlSession.close();
        return res;
    } // end of insert()
    
    // 게시글 하나 조회해서 상세보기
    public BoardVO selectOne(int idx){
        SqlSession sqlSession = factory.openSession();
        BoardVO vo = sqlSession.selectOne("board_selectOne", idx);
        sqlSession.close();
        return vo;
    } // end of selectOne()
    
    // 댓글 추가
    public int insert_reply(BoardVO vo){
        SqlSession sqlSession = factory.openSession(true);
        int res = sqlSession.insert("b.board_insert_reply", vo);
        sqlSession.close();
        return res;
    } // end of insert_reply()

    // 댓글 달기 전 step 수 증가
    public int update_step(BoardVO vo){
        SqlSession sqlSession = factory.openSession(true);
        int res = sqlSession.update("b.board_update_step", vo);
        sqlSession.close();
        return res;
    } // end of update_step()

    // 조회수 업데이트
    public int update_readhit(int idx){
        SqlSession sqlSession = factory.openSession(true);
        int res = sqlSession.update("b.board_update_readhit", idx);
        sqlSession.close();
        return res;
    } // end of update_readhit()

    // 삭제를 위한 update
    public int update_delInfo(int idx){
        SqlSession sqlSession = factory.openSession(true);
        int res = sqlSession.update("b.board_update_delInfo", idx);
        sqlSession.close();
        return res;
    } // end of update_delInfo()
} // end of class



















