package net.java_school.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class LecturesController {

	@GetMapping("java/{article}")
	public String getJavaPosts(@PathVariable String article) {
		return "java/" + article;
	}
	@GetMapping("jdbc/{article}")
	public String getJdbcPosts(@PathVariable String article) {
		return "jdbc/" + article;
	}
	@GetMapping("jsp/{article}")
	public String getJspPosts(@PathVariable String article) {
		return "jsp/" + article;
	}
	@GetMapping("css-layout/{article}")
	public String getCssLayoutPosts(@PathVariable String article) {
		return "css-layout/" + article;
	}
	@GetMapping("jsp-pjt/{article}")
	public String getJspProjectPosts(@PathVariable String article) {
		return "jsp-pjt/" + article;
	}
	@GetMapping("spring/{article}")
	public String getSpringPosts(@PathVariable String article) {
		return "spring/" + article;
	}
	@GetMapping("javascript/{article}")
	public String getJavascriptPosts(@PathVariable String article) {
		return "javascript/" + article;
	}
	@GetMapping("google-app-engine/{article}")
	public String getGoogleAppEnginePosts(@PathVariable String article) {
		return "google-app-engine/" + article;
	}
}