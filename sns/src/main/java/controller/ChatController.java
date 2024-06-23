package controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import service.IF_FollowListService;
import service.IF_ProfileService;
import vo.ChatRoomVO;

@Controller
public class ChatController {
	@Inject
	IF_FollowListService fServe;
	
	@Inject
	IF_ProfileService pServe;
	
	@GetMapping("selProfile")
	public String selProfile(HttpSession session, Model model) throws Exception {
		String id = String.valueOf(session.getAttribute("userid"));
		model.addAttribute("profile", pServe.selectProfile(id));
		return "selProfile";
	}
	
	@GetMapping("newChat")
	public String newChat(HttpSession session, Model model, @RequestParam("nickName") String nick) throws Exception {
		model.addAttribute("nickName", nick);
		String id = String.valueOf(session.getAttribute("userid"));
		model.addAttribute("following", fServe.followingList(id));
		model.addAttribute("follower", fServe.followerList(id));
		return "newChat";
	}
	
	@PostMapping("newChatSave")
	public void newChatSave(HttpServletRequest request) {
		System.out.println(request.getParameter("form"));
	}
}
