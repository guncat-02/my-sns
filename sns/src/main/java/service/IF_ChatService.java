package service;

import vo.ChatRoomVO;

public interface IF_ChatService {
	public void chatRoomInsert(ChatRoomVO cVO) throws Exception;
	public void chatMemberInsert(ChatRoomVO cVO) throws Exception;
}
