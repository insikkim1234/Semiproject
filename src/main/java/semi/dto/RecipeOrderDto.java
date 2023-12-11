package semi.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class RecipeOrderDto {
    @JsonProperty("nRecipeIdx")
    private int nRecipeIdx;
    @JsonProperty("nRecipeNumber")
    private int nRecipeNumber;
    @JsonProperty("sRecipeOrderContent")
    private String sRecipeOrderContent;
    @JsonProperty("sRecipeOrderPhoto")
    private String sRecipeOrderPhoto;
}
