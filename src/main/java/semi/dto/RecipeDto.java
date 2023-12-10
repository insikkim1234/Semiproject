package semi.dto;

import java.sql.Timestamp;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class RecipeDto {

	@JsonProperty private int nRecipeIdx;
	@JsonProperty private String sRecipeTitle;
	@JsonProperty private String sRecipeName;
	@JsonProperty private int sRecipeViewCount;
	@JsonProperty private String sRecipePhoto;
	@JsonProperty private String sRecipeContent;
	@JsonProperty private String sRecipeTime;
	@JsonProperty private String sRecipeDifficulty;
	@JsonProperty private String sRecipeServing;
	@JsonProperty private String sRecipeIngredient;
	@JsonProperty private String sRecipeReply;
	@JsonProperty private Timestamp dtRecipeCreatedAt;
	@JsonProperty private Timestamp dtRecipeUpdatedAt;
}