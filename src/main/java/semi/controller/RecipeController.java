package semi.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import naver.storage.NcpObjectStorageService;
import semi.dao.RecipeDao;
import semi.dto.RecipeDto;
import semi.service.RecipeService;

@Controller
public class RecipeController {
    @Autowired
    private RecipeService recipeService;

    @Autowired
    private RecipeDao recipeDao;
    
    @Autowired
    NcpObjectStorageService storageService;
    
    // 스토리지 연결 - 사진 업로드
    String storagename = "semi-project-eatingalone";
    String storagefolder = "photo";
    @GetMapping("/recipe/sample")
    public String sample() {
        return "recipe/recipeSample";
    }
    
    // 레시피 게시판
    @GetMapping("/recipe/board")
    public String board() {
        return "recipe/recipeBoard";
    }

    // 레시피 업로드 된 사진 스토리지에 업로드 
    @PostMapping("/recipe/insertRecipeApi")
    public String insertRecipeApi(@ModelAttribute RecipeDto dto, HttpServletRequest request, HttpSession session, @RequestParam MultipartFile upload) {
//        String path = request.getSession().getServletContext().getRealPath("/resources/upload");
//        String realPath = "";
//        if(!upload.get(0).getOriginalFilename().equals("")) {
//            for(MultipartFile multi : upload) {
//                String photo = UUID.randomUUID().toString();
//                String extension = multi.getOriginalFilename().substring(multi.getOriginalFilename().lastIndexOf("."));
//                realPath = path + "/" + photo + extension;
//                try {
//                    multi.transferTo(new File(realPath));
//
//                } catch (IllegalStateException e) {
//                    // TODO Auto-generated catch block
//                    e.printStackTrace();
//                } catch (IOException e) {
//                    // TODO Auto-generated catch block
//                    e.printStackTrace();
//                }
//            }
//
//        }
    	
        String photo=storageService.uploadFile(storagename, storagefolder, upload);
   
        dto.setSRecipePhoto(photo);
        recipeService.insertRecipe(dto);

        return "redirect:../";
    }
}
