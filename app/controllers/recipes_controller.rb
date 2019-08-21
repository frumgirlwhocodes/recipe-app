class RecipesController < ApplicationController

def index 
    @recent_recipes=Recipe.recently_added_recipes
    if params[:user_id]
      @user = User.find(params[:user_id])
      if @user.nil?
        redirect_to recipes_path, alert: "User not found"
    else 
      @recipes= @user.recipes 
    end 
  else 
      @recipes=Recipe.all 
      render :index

   end 
  end 
  

    def  new 
       if params[:user_is] && !User.exists?(params[:user_id])
      redirect_to recipes_path, alert: "No User Found"
       else 
      @recipe = Recipe.new(user_id: params[:user_id])
  
      end 


    def create 
        @recipe= Recipe.new(recipes_params)
      
        if @recipe.save 
          
            redirect_to @recipe, notice: "Your recipe was successfully created" 

        else 
            render :new 
        end   
    end 

    def show 
      if params[:user_id]
     @user=User.find_by(id: params[:user_id])
     @recipe=@user.songs.find_by(id: params[:id])
     if @recipe.nil?
      redirect_to user_recipes_path(@recipe), alert: "Recipe not found"
    end
  else
    @Recipe = Recipe.find(params[:id])
  end
      if current_user
        @comment = current_user.comments.build(recipe: @recipe)
      end

    end 

     def edit 
      if params[:user_id]
        user = User.find_by(id: params[:user_id])
        if user.nil?
          redirect_to recipes_path, alert: "User not found"
        else
          @recipe = user.recipes.find_by(id: params[:id])
          redirect_to user_recipes_path(user), alert: "Recipe not found" if @recipe.nil?
        end
      else
        @recipe = Recipe.find(params[:id])
      end
    end

     end 

     def update 
      @recipe = Recipe.find(params[:id])

         @recipe.update(recipes_params)
         if @recipe.save 
            redirect_to @recipe
          else
            render :edit
          end
      
        end

        def destroy
          @recipe.Recipe.find(params[:id])
          @recipe.destroy
          redirect_to recipes_path, notice: "Recipe successfully destroyed."
        end

     
     private 
     def recipes_params 
        params.require(:recipe).permit(:name, :directions, :cook_time, :user_id,  ingredient_id: [ ], 
          ingredients_attributes: [:id, :name])

     end 

     

end
