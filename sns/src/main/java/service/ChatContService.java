package service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dao.IF_ChatContDao;
import vo.ChatContVO;

@Service
public class ChatContService implements IF_ChatContService {
	@Inject
	IF_ChatContDao ccDao;
	
	@Override
	public List<ChatContVO> selectCont(String chatNum) throws Exception {
		return ccDao.selectCont(chatNum);
	}

}
