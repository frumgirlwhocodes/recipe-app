class RecipesController < ApplicationController
before_action :set_recipe, only: [:edit, :show, :update, :destroy]
 
def index 
    @recent_recipes=Recipe.recently_added_recipes
    if params[:user_id]
      @recipes = User.find(params[:user_id]).recipes
    else 
      @recipes=Recipe.all 
      render :index 

   end 
  end 
  

    def new 
      
      @recipe = Recipe.new
  
      end 


    def create 
        @recipe= Recipe.new(recipes_params)
        @recipe.user=current_user 
        if @recipe.save 
            flash[:success]= "Your recipe was created successfully"
            redirect_to user_recipe_path(@recipe)
        else 
            render :new 
        end   
    end 

    def show 
      @recipe=Recipe.find(params[:id])
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

        def destroy
          @recipe.destroy
          redirect_to @recipe, notice: "Recipe successfully destroyed."
        end

     
     private 
     def recipes_params 
        params.require(:recipe).permit(:name, :directions, :cook_time, :user_id,  ingredient_id:[], 
          ingredients_attributes: [:id, :name])

     end 

     def set_recipe
        @recipe = Recipe.find(params[:id])
      end


end
