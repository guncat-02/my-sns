package dao;

import vo.ChatRoomVO;

public interface IF_ChatDao {
	public void chatRoomInsert(ChatRoomVO cVO) throws Exception;
	public void chatMemberInsert(ChatRoomVO cVO) throws Exception;
}
