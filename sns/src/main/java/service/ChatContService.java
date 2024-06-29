package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dao.IF_ChatContDao;
import vo.ChatContVO;

@Service
public class ChatContService implements IF_ChatContService {
	@Inject
	IF_ChatContDao ccDao;
	
	//chatcont 를 불러오기 위한 메서드
	@Override
	public List<ChatContVO> selectCont(String chatNum) throws Exception {
		return ccDao.selectCont(chatNum);
	}

	//chatcont table에 insert
	@Override
	public void insert(ChatContVO ccVO) throws Exception {
		ccDao.insert(ccVO);
	}

	//chatAttach table에 insert
	@Override
	public void insertAttach(ChatContVO ccVO) throws Exception {
		System.out.println("넘어옴");
		Map<String, Object> attach = new HashMap<>();
		attach.put("vo", ccVO);
		for(String file: ccVO.getChatAttach()) {
			attach.put("file", file);
			ccDao.insertAttach(attach);
			System.out.println("ㅗㅑ");
		}
	}

	
}
