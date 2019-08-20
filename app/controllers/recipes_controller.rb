class RecipesController < ApplicationController
before_action :set_recipe, only: [:show,:edit,:update,:destroy]

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
        @user=current_user 
        @recipe.user=@user 
        if @recipe.save 
          
            redirect_to user_recipe_path(@user, @recipe), notice: "Your recipe was successfully created" 
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
        params.require(:recipe).permit(:name, :directions, :cook_time, :user_id,  ingredient_id: [:id], 
          ingredients_attributes: [:id, :name])

     end 

     def set_recipe
        @recipe = Recipe.find(params[:id])
      end


end
