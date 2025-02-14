package net.java_school.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class LecturesController {

	@GetMapping("java/{article}")
	public String getJavaPosts(@PathVariable(name="article") String article) {
		return "java/" + article;
	}
	@GetMapping("jdbc/{article}")
	public String getJdbcPosts(@PathVariable(name="article") String article) {
		return "jdbc/" + article;
	}
	@GetMapping("jsp/{article}")
	public String getJspPosts(@PathVariable(name="article") String article) {
		return "jsp/" + article;
	}
	@GetMapping("css-layout/{article}")
	public String getCssLayoutPosts(@PathVariable(name="article") String article) {
		return "css-layout/" + article;
	}
	@GetMapping("jsp-pjt/{article}")
	public String getJspProjectPosts(@PathVariable(name="article") String article) {
		return "jsp-pjt/" + article;
	}
	@GetMapping("spring/{article}")
	public String getSpringPosts(@PathVariable(name="article") String article) {
		return "spring/" + article;
	}
	@GetMapping("javascript/{article}")
	public String getJavascriptPosts(@PathVariable(name="article") String article) {
		return "javascript/" + article;
	}
	@GetMapping("google-app-engine/{article}")
	public String getGoogleAppEnginePosts(@PathVariable(name="article") String article) {
		return "google-app-engine/" + article;
	}
}
