package semi.dto;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class RecipeDto {
	private int nRecipeIdx;
	private String sRecipeTitle;
	private String sRecipeName;
	private int sRecipeViewCount;
	private String sRecipePhoto;
	private String sRecipeContent;
	private String sRecipeTime;
	private String sRecipeDifficulty;
	private String sRecipeServing;
	private String sRecipeIngredient;
	private String sRecipeReply;
	private Timestamp sRecipeCreatedAt;
	private Timestamp sRecipeUpdatedAt;
}