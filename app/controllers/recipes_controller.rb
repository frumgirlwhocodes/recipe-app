class RecipesController < ApplicationController
before_action :set_recipe, only: [:edit, :show, :update]
   def index 
    if params[:user_id]
			@recipes = User.find(params[:user_id]).recipes

   end 
   

   
    def new 
        @recipe=Recipe.new 

 end 


    def create 
        @recipe= Recipe.new(recipes_params)
        @recipe.user=current_user 
        if @recipe.save 
            flash[:success]= "Your recipe was created successfully"
            redirect_to user_recipes_path 
        else 
            render :new 
        end   
    end 

    def show 
      if current_user
        @comment = current_user.comments.build(recipe: @recipe)
      end

    end 

     def edit 


     end 

     def update 
        if @recipe.update(recipes_params)
            flash[:success] = 'Your recipe was updated successfully'
            redirect_to user_recipe_path(@recipe)
          else
            render :edit
          end
      
        end

     end 
     private 
     def recipes_params 
        params.require(:recipe).permit(:name, :description, :cook_time, user_id, recipe_ingredients_attributes: [
          :id,
          :quantity,
          :recipe_id,
          :ingredient_id,
          ingredient_attributes: [:id, :name]])

     end 

     def set_recipe
        @recipe = Recipe.find(params[:id])
      end


end
