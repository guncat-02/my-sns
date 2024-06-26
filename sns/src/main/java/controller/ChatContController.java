package controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.IF_ChatContService;
import service.IF_ChatService;
import service.IF_ProfileService;
import vo.ChatContVO;
import vo.ChatRoomVO;
import vo.ProfileVO;

@Controller
public class ChatContController {
	@Inject
	IF_ChatContService ccServe;
	@Inject
	IF_ProfileService pServe;
	@Inject
	IF_ChatService cServe;
	
	//채팅 내용을 불러오기 위한 메서드
	@ResponseBody
	@PostMapping("chat/conts")
	public List<ChatContVO> selectCont(@RequestParam("chatNum") String chatNum) throws Exception {
		List<ChatContVO> cont = ccServe.selectCont(chatNum);
		if(cont != null) {
			return cont;
		}
		return null;
	}
	
	//유저의 프로필을 불러오기 위한 메서드
	@ResponseBody
	@PostMapping("chat/users")
	public List<ProfileVO> profileList(@RequestParam("chatNum") String chatNum) throws Exception {
		List<ChatRoomVO> c = cServe.chatMemberList(chatNum);
		List<String> nick = new ArrayList<>();
		for(int i = 0; i < c.size(); i++) {
			nick.add(c.get(i).getNickName());
		}
		return pServe.profileList(nick);
	}
}
