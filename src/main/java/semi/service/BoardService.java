package semi.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;
import lombok.AllArgsConstructor;
import semi.dao.BoardDao;
import semi.dto.BoardDto;
@Service
@AllArgsConstructor
public class BoardService {
	private BoardDao boardDao;
	
	public int getTotalCount()
	{
		return boardDao.getTotalCount();
	}
	
	public List<BoardDto> getList(int start,int perpage)
	{
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("start", start);
		map.put("perpage", perpage);
		
		return boardDao.getList(map);
	}
	
	public int getMaxNum()
	{
		return boardDao.getMaxNum();
	}
	
	public void updateRestep(int regroup,int restep)
	{
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("regroup", regroup);
		map.put("restep", restep);
		
		boardDao.updateRestep(map);
	}
	
	public void insertBoard(BoardDto dto)
	{
		int nComBoardSeq=dto.getNComBoardSeq();//새글일경우 0,답글일경우 0보다 큰값이 들어있다
		int nComBoardRegroup=dto.getNComBoardRegroup();//답글을 단 글의 regroup
		int nComBoardRestep=dto.getNComBoardRestep();//답글을 단 글의 restep
		int nComBoardRelevel=dto.getNComBoardRelevel();//답글을 단 글의 relevel
		
		if(nComBoardSeq==0) {
			//새글인경우
			nComBoardRegroup=boardDao.getMaxNum()+1;
			nComBoardRestep=0;
			nComBoardRelevel=0;			
		}else {
			//답글인경우 그룹은 그대로 사용하므로 regroup 은 따로 안구한다
			//답글인경우
			this.updateRestep(nComBoardRegroup, nComBoardRestep);//같은 그룹중 전달받은 restep보다 큰값이 있는글들은 모두 +1을 해준다
			//그리고 나서 각각의 값에 1을 더한다
			nComBoardRestep=nComBoardRestep+1;
			nComBoardRelevel=nComBoardRelevel+1;
		}
		
		//각각 새로 구한값들을 다시 dto 에 담는다
		dto.setNComBoardRegroup(nComBoardRegroup);
		dto.setNComBoardRestep(nComBoardRestep);
		dto.setNComBoardRelevel(nComBoardRelevel);
		
		//db insert
		boardDao.insertBoard(dto);		
	}
	
	public void updateReadCount(int num)
	{
		boardDao.updateReadCount(num);
	}
	
	public BoardDto getData(int num)
	{
		return boardDao.getData(num);
	}
	public void updateBoard(BoardDto dto)
	{
		boardDao.updateBoard(dto);
	}
	
	public void deleteBoard(int num)
	{
		boardDao.deleteBoard(num);
	}
}