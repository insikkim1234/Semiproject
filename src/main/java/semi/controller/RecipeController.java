package semi.controller;

import annotation.Login;
import naver.storage.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;

import semi.dao.RecipeDao;
import semi.dto.MemberDto;
import semi.dto.RecipeDto;
import semi.dto.RecipeOrderDto;
import semi.service.RecipeOrderService;
import semi.service.RecipeService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
public class RecipeController {
    @Autowired private RecipeOrderService recipeOrderService;
    @Autowired private RecipeService recipeService;
    @Autowired NcpObjectStorageService storageService;

    @GetMapping("/recipe/sample")
    public String sample() {
        return "recipe/recipeSample";
    }
    
    @GetMapping("/recipe/recipeBoardInput")
    public String recipeBoardInput() {
    	return "recipe/recipeBoardInput";
    }

    @PostMapping("/recipe/insertRecipe")
    public String insertRecipe(@Login MemberDto memberDto, @ModelAttribute RecipeDto dto, @ModelAttribute RecipeOrderDto orderdto, HttpServletRequest request, HttpSession session, @RequestParam MultipartFile upload) {
        // 일반화 필요
        if (memberDto == null) {
            return "redirect:/member/login";
        }

        String photo=storageService.uploadFile(NcpObjectStorageService.STORAGE_EATINGALONE,
    			NcpObjectStorageService.DIR_PHOTO, upload);
    	
    	dto.setRecipePhoto(photo);
        dto.setRecipeUserSeq(memberDto.getUserSeq());
    	recipeService.insertRecipe(dto);
    	
    	orderdto.setRecipeOrderPhoto(photo);
    	recipeOrderService.insertOrderRecipe(orderdto);
    	
    	return "redirect:./board";
    }
    
    // 레시피 게시판
    @GetMapping("/recipe/board")
    public String getRecipeList(Model model,String word) {
        //총 레시피 개수 얻기
        int totalCount = recipeService.getTotalCount(word);
        model.addAttribute("totalCount", totalCount);
        return "recipe/recipeBoard";
    }


    @GetMapping("/recipe/orderSample/{recipeIdx}")
    public String getRecipeDetail(Model model, @PathVariable int recipeIdx) {
        List<RecipeOrderDto> dto = recipeOrderService.getRecipeOrdersById(recipeIdx);
        model.addAttribute("recipeOrderDtoList", dto);
        model.addAttribute("recipeIdx", recipeIdx);

        return "recipe/recipeSample/" + recipeIdx;
    }
    
    // 레시피 게시물 상세 페이지
    @GetMapping("/recipe/board/{recipeIdx}")
    public String detail(Model model, @PathVariable int recipeIdx) {
    	// 조회수 증가
    	recipeService.updateViewCount(recipeIdx);
    	
    	// nRecipeIdx에 해당하는 dto 얻기
    	RecipeDto dto = recipeService.getData(recipeIdx);
    	
    	model.addAttribute("dto", dto);
    	
        List<RecipeOrderDto> orderDto = recipeOrderService.getRecipeOrdersById(recipeIdx);
        model.addAttribute("recipeOrderDtoList", orderDto);
        model.addAttribute("recipeIdx", recipeIdx);
    	
    	return "recipe/recipeBoardDetail/" + recipeIdx;
    }
	
}
