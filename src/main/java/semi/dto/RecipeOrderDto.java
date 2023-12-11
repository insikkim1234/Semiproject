package semi.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class RecipeOrderDto {
    private int recipeIdx;
    private int recipeNumber;
    private String recipeOrderContent;
    private String recipeOrderPhoto;
}
