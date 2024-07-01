package controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import service.IF_PostingService;
import service.IF_SearchService;
import vo.SearchVO;

@Controller
public class SearchController {
	@Inject
	IF_SearchService sServe;
	@Inject
	IF_PostingService pServe;
	
	//search로 가기 위한 메서드
	@GetMapping("search")
	public String search(Model model, HttpSession session) throws Exception {
		model.addAttribute("id", String.valueOf(session.getAttribute("userid")));
		List<String> keyWord = sServe.selectKeyWord();
		List<Integer> results = pServe.selectPosts(keyWord);
		model.addAttribute("keyWord", keyWord);
		model.addAttribute("result", results);
		return "search";
	}
	
	
	//searchList로 가기 위한 메서드
	@GetMapping("searchList")
	public String searChList(@ModelAttribute SearchVO sVO) throws Exception {
		System.out.println(sVO.getKeyWord());
		sServe.insertKeyWord(sVO.getKeyWord());
		return "searchList";
	}
}
