package semi.dto;

import lombok.Data;

@Data
public class RecipeUpdateDto {
    private int recipeIdx;
    private String recipeTitle;
    private String recipePhoto;
    private String recipeContent;
    private String recipeTime;
    private String recipeDifficulty;
    private String recipeServing;
    private String recipeIngredient;
}
