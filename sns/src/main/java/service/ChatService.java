package service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dao.IF_ChatDao;
import vo.ChatRoomVO;

@Service
public class ChatService implements IF_ChatService{
	@Inject
	IF_ChatDao cDao;

	//chatRoom table에 insert
	@Override
	public void chatRoomInsert(ChatRoomVO cVO) throws Exception {
		cDao.chatRoomInsert(cVO);
	}

	//chatMember table에 insert
	@Override
	public void chatMemberInsert(ChatRoomVO cVO) throws Exception {
		cDao.chatMemberInsert(cVO);
	}

}
