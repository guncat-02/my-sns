package service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dao.IF_SearchDao;
import vo.PostVO;

@Service
public class SearchService implements IF_SearchService {
	@Inject
	IF_SearchDao sDao;
	
	//keyword를 저장하기 위한 메서드
	@Override
	public void insertKeyWord(String keyWord) throws Exception {
		sDao.insertKeyWord(keyWord);
	}

	//keyWord를 가져오기 위한 메서드
	@Override
	public List<String> selectKeyWord() throws Exception {
		return sDao.selectKeyWord();
	}

	//검색 결과를 가져오기 위한 메서드
	@Override
	public List<PostVO> selectSearchList(Map map) throws Exception {
		return sDao.selectSearchList(map);
	}
}
