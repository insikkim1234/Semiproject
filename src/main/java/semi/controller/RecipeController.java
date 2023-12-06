package semi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RecipeController {
	@GetMapping("/recipe/sample")
	public String sample() {
		return "recipe/recipeSample";
	}
}
