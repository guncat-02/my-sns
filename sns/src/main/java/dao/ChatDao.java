package dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import vo.ChatRoomVO;

@Repository
public class ChatDao implements IF_ChatDao {
	@Inject
	SqlSession sql;
	
	private static String mapperQuery = "dao.IF_ChatDao";

	//chatRoom table에 insert
	@Override
	public void chatRoomInsert(ChatRoomVO cVO) throws Exception {
		sql.insert(mapperQuery+".chatRoomInsert", cVO);
	}

	//chatMember table에 insert
	@Override
	public void chatMemberInsert(ChatRoomVO cVO) throws Exception {
		sql.insert(mapperQuery+".chatMemberInsert", cVO);
	}
	
}
