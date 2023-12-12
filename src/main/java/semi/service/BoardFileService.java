package semi.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import semi.dao.BoardFileDao;
import semi.dto.BoardFileDto;

@Service
@AllArgsConstructor
public class BoardFileService {

	private BoardFileDao boardFileDao;
	
	public void insertPhoto(BoardFileDto dto)
	{
		boardFileDao.insertPhoto(dto);
	}
	
	public List<String> getPhotoByNum(int num)
	{
		return boardFileDao.getPhotoByNum(num);
	}
	
	public List<BoardFileDto> getFileDataByNum(int num)
	{
		return boardFileDao.getFileDataByNum(num);
	}
	
	public void deletePhoto(int idx)
	{
		boardFileDao.deletePhoto(idx);
	}
	
}