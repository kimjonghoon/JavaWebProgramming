package net.java_school.controller;

import java.security.Principal;
import java.util.Collection;
import java.util.List;

import net.java_school.board.BoardService;
import net.java_school.board.Comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("comments")
public class CommentsController {

	@Autowired
	private BoardService boardService;

	@GetMapping("{articleNo}")
	public List<Comment> getAllComments(@PathVariable Integer articleNo, Principal principal, Authentication authentication) {

		List<Comment> comments = boardService.getCommentList(articleNo);

		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		for (GrantedAuthority authority : authorities) {
			String role = authority.getAuthority();
			if (role.equals("ROLE_ADMIN")) {
				boardService.setEditableTrue(comments);
				return comments;
			}
		}

		String username = principal.getName();
		for (Comment comment : comments) {
			if (comment.getEmail().equals(username)) {
				comment.setEditable(true);
			}
		}

		return comments;
	}

	@PostMapping("{articleNo}")
	public void addComment(String memo, @PathVariable Integer articleNo, Principal principal) {
		Comment comment = new Comment();
		comment.setMemo(memo);
		comment.setArticleNo(articleNo);
		comment.setEmail(principal.getName());

		boardService.addComment(comment);
	}

	@PutMapping("{articleNo}/{commentNo}")
	public void updateComment(String memo, @PathVariable Integer articleNo, @PathVariable Integer commentNo, Principal principal) {
		Comment comment = boardService.getComment(commentNo);
		comment.setMemo(memo);
		boardService.modifyComment(comment);
	}

	@DeleteMapping("{articleNo}/{commentNo}")
	public void deleteComment(@PathVariable Integer articleNo, @PathVariable Integer commentNo) {
		System.out.println("테스트1127");
		Comment comment = boardService.getComment(commentNo);
		boardService.removeComment(comment);
	}

}