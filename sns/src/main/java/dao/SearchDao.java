package dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class SearchDao implements IF_SearchDao {
	@Inject
	SqlSession sql;
	
	private static String mapperQuery = "dao.IF_SearchDao";

	//keyWord를 table에 저장
	@Override
	public void insertKeyWord(String keyWord) throws Exception {
		sql.insert(mapperQuery+"insertKeyWord", keyWord);
	}

}
