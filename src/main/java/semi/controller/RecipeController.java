package semi.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import annotation.Login;
import naver.storage.NcpObjectStorageService;
import semi.dto.MemberDto;
import semi.dto.RecipeDto;
import semi.dto.RecipeOrderDto;
import semi.orderBean.OrderBean;
import semi.orderBean.OrderListBean;
import semi.service.RecipeOrderService;
import semi.service.RecipeService;


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
    public String recipeBoardInput(@Login MemberDto memberDto) {
    	return "recipe/recipeBoardInput";
    }

    @PostMapping("/recipe/insertRecipe")
    public String insertRecipe(@Login MemberDto memberDto, @ModelAttribute RecipeDto dto, @ModelAttribute RecipeOrderDto orderdto, @RequestParam MultipartFile upload, @ModelAttribute OrderListBean obList) {
        String photo=storageService.uploadFile(NcpObjectStorageService.STORAGE_EATINGALONE,
    			NcpObjectStorageService.DIR_PHOTO, upload);
    	
    	dto.setRecipePhoto(photo);
        dto.setRecipeUserSeq(memberDto.getUserSeq());
    	recipeService.insertRecipe(dto);
    	
    	ArrayList<OrderBean> list = (ArrayList<OrderBean>) obList.getOrderlist();
    	for(int i = 0; i < obList.getOrderlist().size(); i++) {
    		RecipeOrderDto orderDto = new RecipeOrderDto();
    		OrderBean orderBean = list.get(i);
    		if (orderBean.getRecipeOrderContent() == null) continue;
    		
        	photo=storageService.uploadFile(NcpObjectStorageService.STORAGE_EATINGALONE,
        			NcpObjectStorageService.DIR_PHOTO, orderBean.getUpload());

        	orderDto.setRecipeIdx(dto.getRecipeIdx());
        	orderDto.setRecipeNumber(i + 1);
        	orderDto.setRecipeOrderContent(orderBean.getRecipeOrderContent());
        	orderDto.setRecipeOrderPhoto(photo);
	    	
    		recipeOrderService.insertOrderRecipe(orderDto);
    	}
    	
    	return "redirect:./board";
    }
    
    // 레시피 게시판
    @GetMapping("/recipe/board")
    public String getRecipeList(Model model,String word,@RequestParam(value = "page", required = false, defaultValue = "1") Integer page) {
        //총 레시피 개수 얻기
        int totalCount = recipeService.getTotalCount(word);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("page", page);
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
    
    // 레시피 게시물 수정 페이지로 이동
    @GetMapping("/recipe/update/{recipeIdx}")
    public String getUpdateRecipeForm(@Login MemberDto memberDto, Model model, @PathVariable int recipeIdx) {
        RecipeDto dto = recipeService.getData(recipeIdx);
        model.addAttribute("recipeDto", dto);
        
        List<RecipeOrderDto> recipeOrderDtoList = recipeOrderService.getRecipeOrdersById(recipeIdx);
        model.addAttribute("recipeOrderDtoList", recipeOrderDtoList);
        
        return "recipe/recipeBoardUpdate";
    }

    // 수정 처리
    @PostMapping("/recipe/updateRecipe")
    public String updateRecipe(@ModelAttribute RecipeDto updateDto, @RequestParam MultipartFile upload, @ModelAttribute OrderListBean obList) {
    	String photo=storageService.uploadFile(NcpObjectStorageService.STORAGE_EATINGALONE,
    			NcpObjectStorageService.DIR_PHOTO, upload);
    	
    	updateDto.setRecipePhoto(photo);
        recipeService.updateRecipe(updateDto);
        
        List<RecipeOrderDto> oldOrderDtoList = recipeOrderService.getRecipeOrdersById(updateDto.getRecipeIdx());
        ArrayList<OrderBean> newOrderBeanList = (ArrayList<OrderBean>) obList.getOrderlist();

        int cnt = 0;
        for (int i = 0; i < newOrderBeanList.size(); i++) {
            OrderBean orderBean = newOrderBeanList.get(i);

            if (orderBean.getRecipeOrderContent() == null) {
                continue;
            }

            RecipeOrderDto newOrderDto = new RecipeOrderDto();

            photo = storageService.uploadFile(
                    NcpObjectStorageService.STORAGE_EATINGALONE,
                    NcpObjectStorageService.DIR_PHOTO, orderBean.getUpload());

            if (photo == null
                && i < oldOrderDtoList.size()) {
                newOrderDto.setRecipeOrderPhoto(oldOrderDtoList.get(i).getRecipeOrderPhoto());
            } else {
                newOrderDto.setRecipeOrderPhoto(photo);
            }

            if (cnt < oldOrderDtoList.size()) {
                newOrderDto.setRecipeOrderSeq(oldOrderDtoList.get(cnt).getRecipeOrderSeq());
            }
            newOrderDto.setRecipeIdx(updateDto.getRecipeIdx());
            newOrderDto.setRecipeNumber(cnt + 1);
            newOrderDto.setRecipeOrderContent(orderBean.getRecipeOrderContent());

            recipeOrderService.upsertRecipeOrder(newOrderDto);

            cnt += 1;
        }

        int extraSize = oldOrderDtoList.size() - cnt;
        for (int i = 0; i < extraSize; i++) {
            recipeOrderService.deleteRecipeOrderBySeq(oldOrderDtoList.get(cnt + i).getRecipeOrderSeq());
        }
       
        
        return "redirect:/recipe/board/" + updateDto.getRecipeIdx();
    }
    
	// 레시피 삭제 
	@PostMapping("/recipe/deleteRecipe")
	public String deleteRecipe(@Login MemberDto memberDto, @RequestParam int recipeIdx)
	{
		RecipeDto dto = recipeService.getData(recipeIdx);
         
		if (memberDto.getUserSeq() == dto.getRecipeUserSeq())
		{
			recipeService.deleteRecipe(recipeIdx);
		}
   
		return "redirect:/recipe/board"; 
	}

}
