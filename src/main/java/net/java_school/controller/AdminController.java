package net.java_school.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import net.java_school.board.Board;
import net.java_school.board.BoardService;
import net.java_school.commons.PagingNumbers;
import net.java_school.commons.Paginator;
import net.java_school.commons.WebContants;
import net.java_school.user.User;
import net.java_school.user.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
@RequestMapping("admin")
public class AdminController extends Paginator {

	@Autowired
	private UserService userService;

	@Autowired
	private BoardService boardService;

	@GetMapping
	public String index (
			@RequestParam(name="page", defaultValue="1") Integer page, 
			@RequestParam(name="search", defaultValue="") String search, 
			Model model) {

		if (page == null) return "redirect:/admin?page=1";

		int recordsPerPage = 20;
		int pagesPerGroup = 10;

		int totalRecords = userService.getTotalCount(search);
		PagingNumbers pagingNumbers = this.getPagingNumbers(totalRecords, page, recordsPerPage, pagesPerGroup);

		HashMap<String, String> map = new HashMap<>();

		//Oracle start
		Integer startRecord = (page - 1) * recordsPerPage + 1;
		Integer endRecord = page * recordsPerPage;
		map.put("search", search);
		map.put("startRecord", startRecord.toString());
		map.put("endRecord", endRecord.toString());
		//Oracle end

/*
		//MySQL and MariaDB start
		Integer offset = (page - 1) * numPerPage;
		Integer rowCount = numPerPage;
		map.put("search", search);
		map.put("offset", offset.toString());
		map.put("rowCount", rowCount.toString());
		//MySQL and MariaDB end
*/
		List<User> list = userService.getAllUser(map);

		model.addAttribute("list", list);
		model.addAttribute("pagingNumbers", pagingNumbers);

		return "admin/index";
	}

	@GetMapping("editAccount")
	public String editAccountForm(@RequestParam(name="email") String email, Model model) {
		User user = userService.getUser(email);
		//List<String> authorities = userService.getAuthoritiesOfUser(email);
		model.addAttribute(WebContants.USER_KEY.value(), user);
		//model.addAttribute("authorities", authorities);

		return "admin/editAccount";
	}

	@PostMapping("editAccount")
	public String editAccount(
			@ModelAttribute(name="user") User user, 
			@RequestParam(name="page") String page, 
			@RequestParam(name="search", defaultValue="") String search) throws Exception {
		userService.editAccountByAdmin(user);

		if (search != null && !search.equals("")) {
			search = URLEncoder.encode(search, "UTF-8");
		}
		return "redirect:/admin/editAccount?email=" + user.getEmail() + "&page=" + page + "&search=" + search;
	}

	@PostMapping("changePasswd")
	public String changePasswd(
			@ModelAttribute(name="user") User user, 
			@RequestParam(name="page") String page, 
			@RequestParam(name="search") String search) throws Exception {
		userService.changePasswdByAdmin(user);

		if (search != null && !search.equals("")) {
			search = URLEncoder.encode(search, "UTF-8");
		}
		return "redirect:/admin/editAccount?email=" + user.getEmail() + "&page=" + page + "&search=" + search;
	}

	@PostMapping("delUser")
	public String delUser(
			@ModelAttribute(name="user") User user, 
			@RequestParam(name="page") String page, 
			@RequestParam(name="search", defaultValue="") String search) throws Exception {
		userService.delUser(user);

		if (search != null && !search.equals("")) {
			search = URLEncoder.encode(search, "UTF-8");
		}
		return "redirect:/admin?email=" + user.getEmail() + "&page=" + page + "&search=" + search;
	}

	@GetMapping("board")
	public String boardList(Model model) {
		List<Board> boards = boardService.getBoards();
		model.addAttribute("boards", boards);

		return "admin/board";
	}

	@PostMapping("createBoard")
	public String createBoard(@ModelAttribute(name="board") Board board) {
		boardService.createBoard(board);

		return "redirect:/admin/board";
	}

	@PostMapping("editBoard")
	public String editBoard(@ModelAttribute(name="board") Board board) {
		boardService.editBoard(board);

		return "redirect:/admin/board";
	}

	@GetMapping("delAuthority")
	public String delAuthority(
			@RequestParam(name="authority") String authority, 
			@RequestParam(name="email") String email, 
			@RequestParam(name="page") String page, 
			@RequestParam(name="search", defaultValue="") String search) throws Exception {

		userService.delAuthorityOfUser(email, authority);
		if (search != null && !search.equals("")) {
			search = URLEncoder.encode(search, "UTF-8");
		}
		return "redirect:/admin/editAccount?email=" + email + "&page=" + page + "&search=" + search;
	}

	@PostMapping("addAuthority")
	public String addAuthority(
			@RequestParam(name="authority") String authority, 
			@RequestParam(name="email") String email, 
			@RequestParam(name="page") String page, 
			@RequestParam(name="search", defaultValue="") String search) throws Exception {

		userService.addAuthority(email, authority);
		if (search != null && !search.equals("")) {
			search = URLEncoder.encode(search, "UTF-8");
		}
		return "redirect:/admin/editAccount?email=" + email + "&page=" + page + "&search=" + search;
	}
}
