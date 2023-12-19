package semi.dao;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import semi.dto.BoardDto;
@Repository
public class BoardDao {
	@Autowired
	private SqlSession session;
	
	private String nameSpace="semi.dao.BoardDao.";
	
	//전체 갯수 반환하는 메서드
	public int getTotalCount(String searchWord)
	{
		return session.selectOne(nameSpace+"totalCountOfBoard", searchWord);
	}
	
	public void insertBoard(BoardDto dto)
	{
		session.insert(nameSpace+"insertBoard", dto);
	}
	
	public List<BoardDto> getAllData()
	{
		return session.selectList(nameSpace+"selectAllBoard");
	}
	
	

	public List<BoardDto> getBoardWithPage(Map<String, Object> map)
	{
		return session.selectList(nameSpace+"selectBoardWithPage", map);
	}
	
	public void updateReadcount(int comBoardSeq)
	{
		session.update(nameSpace+"updateReadcount", comBoardSeq);
	}
	
	
	
	public void deleteBoard(int comBoardSeq)
	{
		session.delete(nameSpace+"deleteBoard", comBoardSeq);
	}
	
	public void updateBoard(BoardDto dto)
	{
		session.update(nameSpace+"updateBoard", dto);
	}
	
	//게시글 확인
	public BoardDto getData(int comBoardSeq)
	{
		return session.selectOne(nameSpace+"selectDataByNum", comBoardSeq);
	}
}