package service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dao.IF_SearchDao;

@Service
public class SearchService implements IF_SearchService {
	@Inject
	IF_SearchDao sDao;
	
	//keyword를 저장하기 위한 메서드
	@Override
	public void insertKeyWord(String keyWord) throws Exception {
		sDao.insertKeyWord(keyWord);
	}

}
