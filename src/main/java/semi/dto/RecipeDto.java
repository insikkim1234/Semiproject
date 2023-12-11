package semi.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class RecipeDto {
	@JsonProperty("nRecipeIdx")
	private int nRecipeIdx;
	@JsonProperty("sRecipeTitle")
	private String sRecipeTitle;
	@JsonProperty("sRecipeName")
	private String sRecipeName;
	@JsonProperty("nRecipeViewCount")
	private int nRecipeViewCount;
	@JsonProperty("sRecipePhoto")
	private String sRecipePhoto;
	@JsonProperty("sRecipeContent")
	private String sRecipeContent;
	@JsonProperty("sRecipeTime")
	private String sRecipeTime;
	@JsonProperty("sRecipeDifficulty")
	private String sRecipeDifficulty;
	@JsonProperty("sRecipeServing")
	private String sRecipeServing;
	@JsonProperty("sRecipeIngredient")
	private String sRecipeIngredient;
	@JsonProperty("sRecipeReply")
	private String sRecipeReply;
	@JsonProperty("sRecipeCreatedAt")
	private Timestamp sRecipeCreatedAt;
	@JsonProperty("sRecipeUpdatedAt")
	private Timestamp sRecipeUpdatedAt;
}