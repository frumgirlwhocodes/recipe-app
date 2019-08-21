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
       if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to recipes_path, alert: "No User Found"
       else 
      @recipe = Recipe.new(user_id: params[:user_id])
     10.times do @recipe.ingredients.build 
     end 
      end 
    end 


    def create 
        @recipe= Recipe.new(recipes_params)
        @recipe.user=current_user 

      
        if @recipe.save
      
          
            redirect_to user_recipe_path(@recipe.user, @recipe), notice: "Your recipe was successfully created" 

        else 
            render :new 
        end   
    end 

    def show 
      if params[:user_id]
     @user=User.find_by(id: params[:user_id])
     @recipe=@user.recipes.find_by(id: params[:id])
     if @recipe.nil?
      redirect_to user_recipes_path(@recipe.user, @recipe), alert: "Recipe not found"
    end
  else
    @recipe = Recipe.find(params[:id])
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
          @recipe=Recipe.find(params[:id])
          @recipe.destroy
          redirect_to recipes_path, notice: "Recipe successfully destroyed."
        end

     
     private 
    
     def recipes_params 
        params.require(:recipe).permit(:name, :directions, :cook_time, :user_id,  ingredient_ids: [ ], 
          ingredients_attributes: [:id, :name])
     end 
    end 
