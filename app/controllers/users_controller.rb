class UsersController < ApplicationController
    
    before_action :require_login, except: [:new, :create] 
  
    def new
		@user = User.new
	end

	def create
		@user = User.new (user_params)
		if @user.valid?
			@user.save
			flash[:success] = 'Your account has been created successfully'
			session[:user_id] = @user.id
	 current_user=@user 
			redirect_to user_path(@user)
		else
			render new_user_path
		end
	end
	
    
    def show 

	 @user=current_user 
	 @recipes=@user.recipes 

    end 
private 

def user_params 
    params.require(:user).permit(:name, :email, :password_digest)

end
end 
