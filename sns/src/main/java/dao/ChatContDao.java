package dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import vo.ChatContVO;

@Repository
public class ChatContDao implements IF_ChatContDao {
	@Inject
	SqlSession sql;
	
	private static String mapperQuery = "dao.IF_ChatContDao";

	@Override
	public List<ChatContVO> selectCont(String chatNum) throws Exception {
		return sql.selectList(mapperQuery+".selectCont", chatNum);
	}

}
