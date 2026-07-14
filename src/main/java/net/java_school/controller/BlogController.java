package net.java_school.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.ui.Model;

@Controller
public class BlogController {

	@GetMapping("blog")
	public String blogIndex() {
		return "blog/index";
	}

	@GetMapping("blog/{slug}")
	public String getBlog(@PathVariable(name="slug") String slug, Model model) {
		model.addAttribute("slug",slug);
		return "blog/view";
	}

	@GetMapping("blog/{year}/{slug}")
	public String getBlog(@PathVariable(name="year") String year, @PathVariable(name="slug") String slug) {
		return "blog/" + year + "/" + slug;
	}

}
