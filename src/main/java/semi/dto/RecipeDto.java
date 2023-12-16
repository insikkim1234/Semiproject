package semi.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class RecipeDto {
	private int recipeIdx;
	private int recipeUserSeq;
	private String recipeTitle;
	private String recipeName;
	private int recipeViewCount;
	private String recipePhoto;
	private String recipeContent;
	private String recipeTime;
	private String recipeDifficulty;
	private String recipeServing;
	private String recipeIngredient;
	private Timestamp recipeCreatedAt;
	private Timestamp recipeUpdatedAt;	
}