
class CommentsController < ApplicationController
    before_action :set_recipe
  
    def create
      @comment = current_user.comments.create(comment_params)
      @comment.recipe = @recipe
    
        if @comment.save
          redirect_to user_recipe_path( @recipe) 
          flash[:success]= 'Comment was successfully created.' 
        
        else
         redirect_to new_user_recipe_path(@re
         
        end
      end
    
      def destroy
        @comment = @recipe.comments.find(params[:id])
        @comment.destroy
        redirect_to recipes_path, notice: 'Comment was successfully destroyed.'
      end 
  
  
    private
  
    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end
  
    def comment_params
      params.require(:comment).permit(:body)
    end
  end  