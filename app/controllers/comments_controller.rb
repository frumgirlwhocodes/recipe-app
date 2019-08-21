
class CommentsController < ApplicationController
    before_action :set_recipe
  
    def create
      @comment = current_user.comments.create(comment_params)
      @comment.recipe = @recipe
      
    
        if @comment.save
          redirect_to @recipe, notice: 'Comment was successfully created.'
        
        else
          redirect_to @recipe, notice: "You can't leave the comment box blank.Please try again!"
      
        end
      end
    
      def destroy
        @comment = @recipe.comments.find(params[:id])
        @comment.destroy
        redirect_to recipes_path, notice: 'Comment was successfully destroyed.'
      end 
  
  
    private
  
    def set_recipe
      @recipe = Recipe.find_by(id: params[:recipe_id])
    end
  
    def comment_params
      params.require(:comment).permit(:body)
    end
  end  