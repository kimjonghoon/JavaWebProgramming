package net.java_school.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class BlogController {

	@GetMapping("blog")
	public String blogIndex() {
		return "blog/index";
	}

	@GetMapping("blog/{year}/{article}")
	public String getBlog(@PathVariable(name="year") String year, @PathVariable(name="article") String article) {
		return "blog/" + year + "/" + article;
	}

}
