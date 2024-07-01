package service;

import java.util.List;

public interface IF_SearchService {
	public void insertKeyWord(String keyWord) throws Exception;
	public List<String> selectKeyWord() throws Exception;
}
