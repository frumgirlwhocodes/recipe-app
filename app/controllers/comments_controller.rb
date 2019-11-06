
class CommentsController < ApplicationController
    before_action :set_recipe
  
    def create
      @comment = current_user.comments.create(comment_params)
      @comment.recipe = @recipe
       if @comment.save
        repsond_to do |f| 
       f.html{ redirect_to @recipe, notice: 'Comment was successfully created.'}
       f.json{ render json: @comment, status: 201 }  
        else
        f.html{ redirect_to @recipe, notice: "You can't leave the comment box blank.Please try again!"} 
        f.json { @comment.errors, status: 400 }
        end 
        end
      end
    

  
    private
  
    def set_recipe
      @recipe = Recipe.find_by(id: params[:recipe_id])
    end
  
    def comment_params
      params.require(:comment).permit(:body)
    end
  end  