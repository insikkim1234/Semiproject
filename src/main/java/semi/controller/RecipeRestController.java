package semi.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.*;

import semi.dao.RecipeDao;
import semi.dto.PageDto;
import semi.dto.PageInfo;
import semi.dto.RecipeOrderDto;
import semi.service.RecipeOrderService;
import semi.service.RecipeService;
import utils.BoardUtils;

@RestController
public class RecipeRestController {
   @Autowired private RecipeDao recipeDao;
   @Autowired private RecipeOrderService recipeOrderService;
   @Autowired private RecipeService recipeService;


   //dto 불러오기
   @GetMapping("/recipe/view")
   HashMap<String,Object> getSearchList(
         @RequestParam(required = false) String word, @RequestParam(value = "page", required = false, defaultValue = "1") Integer page)
    {
        int totalCount = recipeService.getTotalCount(word);
        PageInfo pageInfo = this.getPageInfo(page, totalCount);
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        //총 레시피 개수 얻기
        resultMap.put("pageInfo", pageInfo);
        resultMap.put("data", recipeService.getRecipeBySearchWord(word,pageInfo));
        resultMap.put("totalCount", totalCount);
        
       return resultMap;
    }

   // region RecipeOrder

   @GetMapping("recipe/orderView/{recipeIdx}")
   public List<RecipeOrderDto> getRecipeOrdersById(@PathVariable int recipeIdx) {
      return recipeOrderService.getRecipeOrdersById(recipeIdx);
   }
   
   public PageInfo getPageInfo(int currentPage, int totalCount) {
         
         int boardLimit = 12;
         int navLimit = 10;
         int maxPage = (int) Math.ceil((double) totalCount / boardLimit);   // navTotalCount
         int startNav = (((int)((double) currentPage / navLimit + 0.9)) - 1) * navLimit + 1;
         int endNav = startNav + navLimit - 1;
         if(endNav > maxPage) {
            endNav = maxPage;
         }
         
         PageInfo pageInfo = new PageInfo(currentPage, boardLimit, totalCount, navLimit, startNav, endNav, maxPage);
         
         return pageInfo;
      }
}