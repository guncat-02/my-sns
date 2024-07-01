package dao;

import java.util.List;

public interface IF_SearchDao {
	public void insertKeyWord(String keyWord) throws Exception;
	public List<String> selectKeyWord() throws Exception;
}
