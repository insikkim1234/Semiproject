package semi.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import semi.dto.BoardFileDto;

@Repository
public class BoardFileDao {

	@Autowired
	private SqlSession session;
	
	private String nameSpace="semi.dao.BoardFileDao.";
	
	public void insertPhoto(BoardFileDto dto)
	{
		session.insert(nameSpace+"insertPhotoOfFile", dto);
	}
	
	public List<String> getPhotoByNum(int num)
	{
		return session.selectList(nameSpace+"selectAllPhotoByNum", num);
	}
	
	public List<BoardFileDto> getFileDataByNum(int num)
	{
		return session.selectList(nameSpace+"selectAllDataByNum", num);
	}
	
	public void deletePhoto(int idx)
	{
		session.delete(nameSpace+"deletePhotoByIdx", idx);
	}
}