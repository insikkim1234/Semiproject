package semi.dto;

import lombok.Data;

@Data
public class RecipeOrderDto {
    private int recipeOrderSeq;
    private int recipeIdx;
    private int recipeNumber;
    private String recipeOrderContent;
    private String recipeOrderPhoto;
}
