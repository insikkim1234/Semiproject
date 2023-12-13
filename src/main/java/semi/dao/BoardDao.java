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
	public int getTotalCount()
	{
		return session.selectOne(nameSpace+"totalCountOfBoard");
	}
	
	public void insertBoard(BoardDto dto)
	{
		session.insert(nameSpace+"insertBoard", dto);
	}
	
	public List<BoardDto> getAllDatas()
	{
		return session.selectList(nameSpace+"selectAllBoard");
	}
	
	public void updateReadcount(int nComBoardSeq)
	{
		session.update(nameSpace+"updateReadcount", nComBoardSeq);
	}
	
	public BoardDto getData(int nComBoardSeq)
	{
		return session.selectOne(nameSpace+"selectOneData", nComBoardSeq);
	}
	
	public void deleteBoard(int nComBoardSeq)
	{
		session.delete(nameSpace+"deleteBoard", nComBoardSeq);
	}
	
	public void updateBoard(BoardDto dto)
	{
		session.update(nameSpace+"updateBoard", dto);
	}
}