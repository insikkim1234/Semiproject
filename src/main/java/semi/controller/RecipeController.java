package semi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PathVariable;
import semi.dao.RecipeDao;
import semi.dto.RecipeOrderDto;
import semi.service.RecipeOrderService;

import java.util.List;


@Controller
public class RecipeController {
    @Autowired private RecipeOrderService recipeOrderService;
    @Autowired private RecipeDao recipeDao;

    @GetMapping("/recipe/sample")
    public String sample() {
        return "recipe/recipeSample";
    }
    
    // 레시피 게시판
    @GetMapping("/recipe/board")
    public String getRecipeList(Model model) {
        //총 레시피 개수 얻기
        int totalCount = recipeDao.getTotalCount();
        model.addAttribute("totalCount", totalCount);
        return "recipe/recipeBoard";
    }

    @GetMapping("/recipe/orderSample/{recipeIdx}")
    public String getRecipeDetail(Model model, @PathVariable int recipeIdx) {
        List<RecipeOrderDto> dto = recipeOrderService.getRecipeOrdersById(recipeIdx);
        model.addAttribute("RecipeOrderDtoList", dto);

        return "recipe/orderSample/" + recipeIdx;
    }

}
