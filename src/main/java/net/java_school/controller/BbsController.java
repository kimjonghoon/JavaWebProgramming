package net.java_school.controller;

import java.io.File;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.text.DateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import jakarta.servlet.http.HttpServletRequest;

import net.java_school.board.Article;
import net.java_school.board.AttachFile;
import net.java_school.board.Board;
import net.java_school.board.BoardService;
import net.java_school.commons.NumbersForPaging;
import net.java_school.commons.Paginator;
import net.java_school.commons.WebContants;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;

import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;

@Controller
@RequestMapping("bbs")
public class BbsController extends Paginator {
	private Logger log = LogManager.getLogger("net.java_school");

	@Autowired
	private BoardService boardService;

	private String getBoardName(String boardCd, String lang) {
		Board board = boardService.getBoard(boardCd);

		switch (lang) {
			case "en":
				return board.getBoardNm();
			case "ko":
				return board.getBoardNm_ko();
			default:
				return board.getBoardNm();
		}
	}

	@GetMapping("{boardCd}")
	public String list(@CookieValue(value="numPerPage", defaultValue="10") String num,
		       	@PathVariable String boardCd,
		       	Integer page,
		       	String searchWord,
		       	Locale locale,
		       	Model model) {

		if (page == null) {
			page = 1;
		}

		int numPerPage = Integer.parseInt(num);
		int pagePerBlock = 10;

		int totalRecord = boardService.getTotalRecord(boardCd, searchWord);

		NumbersForPaging numbers = this.getNumbersForPaging(totalRecord, page, numPerPage, pagePerBlock);

		HashMap<String, String> map = new HashMap<>();

		map.put("boardCd", boardCd);
		map.put("searchWord", searchWord);

		//Oracle start
		Integer startRecord = (page - 1) * numPerPage + 1;
		Integer endRecord = page * numPerPage;
		map.put("start", startRecord.toString());
		map.put("end", endRecord.toString());
		//Oracle end

/*		
		//MySQL and MariaDB start
		Integer offset = (page - 1) * numPerPage;
		Integer rowCount = numPerPage;
		map.put("offset", offset.toString());
		map.put("rowCount", rowCount.toString());
		//MySQL and MariaDB end
*/
		List<Article> list = boardService.getArticleList(map);

		Integer listItemNo = numbers.getListItemNo();
		Integer prevPage = numbers.getPrevBlock();
		Integer nextPage = numbers.getNextBlock();
		Integer firstPage = numbers.getFirstPage();
		Integer lastPage = numbers.getLastPage();
		Integer totalPage = numbers.getTotalPage();

		model.addAttribute("list", list);
		model.addAttribute("listItemNo", listItemNo);
		model.addAttribute("prevPage", prevPage);
		model.addAttribute("nextPage", nextPage);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("totalPage", totalPage);

		String lang = locale.getLanguage();
		List<Board> boards = boardService.getBoards();
		String boardName = this.getBoardName(boardCd, lang);
		model.addAttribute("boards", boards);
		model.addAttribute("boardName", boardName);
		model.addAttribute("boardCd", boardCd);

		return "bbs/list";
	}

	@GetMapping("{boardCd}/{articleNo}")
	public String view(@CookieValue(value="numPerPage", defaultValue="10") String num,
		       	@PathVariable String boardCd,
		       	@PathVariable Integer articleNo,
			Integer page,
		       	String searchWord,
		       	Locale locale,
		       	HttpServletRequest req,
		       	Model model) {

		if (page == null) {
			page = 1;
		}

		String lang = locale.getLanguage();

		//articleNo, user'ip, yearMonthDayHour
		String ip = req.getRemoteAddr();
		LocalDateTime now = LocalDateTime.now();
		Integer year = now.getYear();
		Integer month = now.getMonthValue();
		Integer day = now.getDayOfMonth();
		Integer hour = now.getHour();
		String yearMonthDayHour = year.toString() + month.toString() + day.toString() + hour.toString();

		try {
			boardService.increaseHit(articleNo, ip, yearMonthDayHour);
		} catch (Exception e) {

		}

		Article article = boardService.getArticle(articleNo);
		List<AttachFile> attachFileList = boardService.getAttachFileList(articleNo);
		Article nextArticle = boardService.getNextArticle(articleNo, boardCd, searchWord);
		Article prevArticle = boardService.getPrevArticle(articleNo, boardCd, searchWord);
		//List<Comment> commentList = boardService.getCommentList(articleNo);
		String boardName = this.getBoardName(boardCd, lang);

		String title = article.getTitle();
		String content = article.getContent();
		//int hit = article.getHit();
		String name = article.getName();
		String email = article.getEmail();

		Date date = article.getRegdate();
		DateFormat df = DateFormat.getDateInstance(DateFormat.MEDIUM, locale);
		String regdate = df.format(date);
		df = DateFormat.getTimeInstance(DateFormat.MEDIUM, locale);
		regdate = regdate + " " + df.format(date);

		int hit = boardService.getTotalViews(articleNo);

		model.addAttribute("title", title);
		model.addAttribute("content", content);
		model.addAttribute("hit", hit);
		model.addAttribute("name", name);
		model.addAttribute("email", email);
		model.addAttribute("regdate", regdate);
		model.addAttribute("attachFileList", attachFileList);
		model.addAttribute("nextArticle", nextArticle);
		model.addAttribute("prevArticle", prevArticle);
		//model.addAttribute("commentList", commentList);

		int numPerPage = Integer.parseInt(num);
		int pagePerBlock = 10;

		int totalRecord = boardService.getTotalRecord(boardCd, searchWord);

		NumbersForPaging numbers = this.getNumbersForPaging(totalRecord, page, numPerPage, pagePerBlock);

		HashMap<String, String> map = new HashMap<>();
		map.put("boardCd", boardCd);
		map.put("searchWord", searchWord);

		//Oracle start
		Integer startRecord = (page - 1) * numPerPage + 1;
		Integer endRecord = page * numPerPage;
		map.put("start", startRecord.toString());
		map.put("end", endRecord.toString());
		//Oracle end
/*
		//MySQL and MariaDB start
		Integer offset = (page - 1) * numPerPage;
		Integer rowCount = numPerPage;
		map.put("offset", offset.toString());
		map.put("rowCount", rowCount.toString());
		//MySQL and MariaDB end
*/
		List<Article> list = boardService.getArticleList(map);

		int listItemNo = numbers.getListItemNo();
		int prevPage = numbers.getPrevBlock();
		int nextPage = numbers.getNextBlock();
		int firstPage = numbers.getFirstPage();
		int lastPage = numbers.getLastPage();
		int totalPage = numbers.getTotalPage();

		model.addAttribute("list", list);
		model.addAttribute("listItemNo", listItemNo);
		model.addAttribute("prevPage", prevPage);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("nextPage", nextPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("boardName", boardName);

		List<Board> boards = boardService.getBoards();
		model.addAttribute("boards", boards);

		model.addAttribute("articleNo", articleNo);
		model.addAttribute("boardCd", boardCd);
		
		return "bbs/view";
	}

	@GetMapping("{boardCd}/new")
	public String writeForm(@PathVariable String boardCd,
		       	Locale locale,
		       	Model model) {

		String lang = locale.getLanguage();
		String boardName = this.getBoardName(boardCd, lang);
		List<Board> boards = boardService.getBoards();

		model.addAttribute("boardName", boardName);
		model.addAttribute("article", new Article());
		model.addAttribute("boards", boards);
		model.addAttribute("boardCd", boardCd);

		return "bbs/write";
	}

	@PostMapping("{boardCd}")
	public String write(@Valid Article article,
			BindingResult bindingResult,
			@PathVariable String boardCd,
			Locale locale,
			Model model,
			@RequestParam("attachFile") MultipartFile attachFile,
			Principal principal) throws Exception {
		/*
		if (article != null) {
			log.debug(article.getTitle());
			log.debug("article is not null but title is null");
		} else log.debug("Article is null!!!");
		*/

		if (bindingResult.hasErrors()) {
			String boardName = this.getBoardName(boardCd, locale.getLanguage());
			model.addAttribute("boardName", boardName);
			List<Board> boards = boardService.getBoards();
			model.addAttribute("boards", boards);
			model.addAttribute("boardCd", boardCd);

			return "bbs/write";
		}

		article.setBoardCd(boardCd);
		article.setEmail(principal.getName());

		boardService.addArticle(article);

		if (!attachFile.isEmpty()) {
			AttachFile file = new AttachFile();
			file.setFilename(attachFile.getOriginalFilename());
			file.setFiletype(attachFile.getContentType());
			file.setFilesize(attachFile.getSize());
			file.setArticleNo(article.getArticleNo());
			file.setEmail(principal.getName());
			boardService.addAttachFile(file);

			log.warn("1---");
			File dir = new File(WebContants.UPLOAD_PATH + principal.getName());
			log.warn("2---");
			if (!dir.exists()) dir.mkdirs();
			log.warn("3---");

			Path path = Paths.get(WebContants.UPLOAD_PATH + principal.getName());
			log.warn("4---");

			try (InputStream inputStream = attachFile.getInputStream()) {
			log.warn("5---");
				Files.copy(inputStream, path.resolve(attachFile.getOriginalFilename()),
						StandardCopyOption.REPLACE_EXISTING);
			log.warn("7---");
			}

		}

		return "redirect:/bbs/" + article.getBoardCd() + "?page=1";
	}

	@GetMapping("{boardCd}/{articleNo}/edit")
	public String modifyForm(@PathVariable String boardCd,
		       	@PathVariable Integer articleNo,
		       	Locale locale,
		       	Model model) {

		String lang = locale.getLanguage();
		Article article = boardService.getArticle(articleNo);
		String boardName = this.getBoardName(boardCd, lang);

		model.addAttribute("article", article);
		model.addAttribute("boardName", boardName);

		List<Board> boards = boardService.getBoards();
		model.addAttribute("boards", boards);
		model.addAttribute("boardCd", boardCd);
		model.addAttribute("articleNo", articleNo);

		return "bbs/modify";
	}

	@PostMapping("{boardCd}/{articleNo}")
	public String modify(@Valid Article article,
			BindingResult bindingResult,
			@PathVariable String boardCd,
			@PathVariable Integer articleNo,
			Integer page,
			String searchWord,
			MultipartFile attachFile,
			Locale locale,
			Model model) throws Exception {

		if (article != null) {
			log.debug(article.getTitle());
			log.debug("article is not null but title is null");
		}
		else
			log.debug("Article is null!!!");
		if (bindingResult.hasErrors()) {
			String boardName = this.getBoardName(article.getBoardCd(), locale.getLanguage());
			model.addAttribute("boardName", boardName);
			List<Board> boards = boardService.getBoards();
			model.addAttribute("boards", boards);
			model.addAttribute("boardCd", boardCd);
			model.addAttribute("articleNo", articleNo);

			return "bbs/modify";
		}

		article.setArticleNo(articleNo);
		article.setBoardCd(boardCd);
		String email = boardService.getArticle(article.getArticleNo()).getEmail();
		article.setEmail(email);

		boardService.modifyArticle(article);

		if (!attachFile.isEmpty()) {
			AttachFile file = new AttachFile();
			file.setFilename(attachFile.getOriginalFilename());
			file.setFiletype(attachFile.getContentType());
			file.setFilesize(attachFile.getSize());
			file.setArticleNo(article.getArticleNo());
			file.setEmail(article.getEmail());
			boardService.addAttachFile(file);

			File dir = new File(WebContants.UPLOAD_PATH + email);
			if (!dir.exists()) dir.mkdirs();

			Path path = Paths.get(WebContants.UPLOAD_PATH + email);

			try (InputStream inputStream = attachFile.getInputStream()) {
				Files.copy(inputStream, path.resolve(attachFile.getOriginalFilename()),
						StandardCopyOption.REPLACE_EXISTING);
			}
		}

		searchWord = URLEncoder.encode(searchWord, "UTF-8");

		return "redirect:/bbs/"
			+ boardCd
			+ "/"
			+ articleNo
			+ "?page="
			+ page
			+ "&searchWord="
			+ searchWord;
	}

	@DeleteMapping("/{boardCd}/{articleNo}")
	public String deleteArticle(@PathVariable String boardCd,
		       	@PathVariable Integer articleNo,
		       	Integer page,
		       	String searchWord) throws Exception {

		Article article = boardService.getArticle(articleNo);
		boardService.removeArticle(article);

		searchWord = URLEncoder.encode(searchWord, "UTF-8");

		return "redirect:/bbs/"
			+ boardCd
			+ "?page="
			+ page
			+ "&searchWord="
			+ searchWord;
	}

	@DeleteMapping("deleteAttachFile")
	public String deleteAttachFile(Integer attachFileNo,
			Integer articleNo,
			String boardCd,
			Integer page,
			String searchWord) throws Exception {

		AttachFile attachFile = boardService.getAttachFile(attachFileNo);
		boardService.removeAttachFile(attachFile);

		searchWord = URLEncoder.encode(searchWord, "UTF-8");

		return "redirect:/bbs/"
			+ boardCd
			+ "/"
			+ articleNo
			+ "?page="
			+ page
			+ "&searchWord="
			+ searchWord;
	}
}
