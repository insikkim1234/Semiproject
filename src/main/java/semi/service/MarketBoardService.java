package semi.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

import semi.dao.MarketBoardDao;
import semi.dto.MarketBoardDto;

@Service
@AllArgsConstructor
public class MarketBoardService {

	private MarketBoardDao marketBoardDao;

	public int getTotalCount() {
		return marketBoardDao.getTotalCount();
	}

	public List<MarketBoardDto> getList(int start, int perpage) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("perpage", perpage);

		return marketBoardDao.getList(map);
	}

	public int getMaxNum() {
		return marketBoardDao.getMaxNum();
	}

	/*
	 * public void updateRestep(int regroup,int restep) { Map<String, Integer>
	 * map=new HashMap<String, Integer>(); map.put("regroup", regroup);
	 * map.put("restep", restep);
	 * 
	 * boardDao.updateRestep(map); }
	 */
	/*
	public void insertMarketBoard(MarketBoardDto dto) {
		int num=dto.getNum();//�����ϰ�� 0,����ϰ�� 0���� ū���� ����ִ�
		int regroup=dto.getRegroup();//����� �� ���� regroup
		int restep=dto.getRestep();//����� �� ���� restep
		int relevel=dto.getRelevel();//����� �� ���� relevel
		
		if(num==0) {
			//�����ΰ��
			regroup=boardDao.getMaxNum()+1;
			restep=0;
			relevel=0;			
		}else {
			//����ΰ�� �׷��� �״�� ����ϹǷ� regroup �� ���� �ȱ��Ѵ�
			//����ΰ��
			this.updateRestep(regroup, restep);//���� �׷��� ���޹��� restep���� ū���� �ִ±۵��� ��� +1�� ���ش�
			//�׸��� ���� ������ ���� 1�� ���Ѵ�
			restep=restep+1;
			relevel=relevel+1;
		}
		
		//���� ���� ���Ѱ����� �ٽ� dto �� ��´�
		dto.setRegroup(regroup);
		dto.setRestep(restep);
		dto.setRelevel(relevel);
		
		// db insert
		marketBoardDao.insertMarketBoard(dto);
	}
	*/

	public void updateReadCount(int num) {
		marketBoardDao.updateReadCount(num);
	}

	public MarketBoardDto getData(int num) {
		return marketBoardDao.getData(num);
	}

	public void updateBoard(MarketBoardDto dto) {
		marketBoardDao.updateBoard(dto);
	}

	public void deleteBoard(int num) {
		marketBoardDao.deleteBoard(num);
	}

}

