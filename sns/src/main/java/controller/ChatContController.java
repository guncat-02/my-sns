package controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import service.IF_ChatContService;
import vo.ChatContVO;

@Controller
public class ChatContController {
	@Inject
	IF_ChatContService ccServe;
	
	@PostMapping("chat/conts")
	public List<ChatContVO> selectCont(@RequestBody String chatNum) throws Exception {
		System.out.println("일단 넘어옴");
		return ccServe.selectCont(chatNum);
	}
}
