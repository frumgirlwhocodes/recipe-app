class SessionsController < ApplicationController 

    def signin 
        @user=User.new 

    end 

    def create 
        @user= User.find(id: params[:user][:id])
   if @user && @user.authenticate(params[:user][:password])
    session[:user_id]=@user.id 
    redirect_to user_path(@user)
   else 
    flash[:errors]= "Incorrect Username and Password"
    render 'sessions/signin'
    end 
end 

def delete 
session.destroy 
redirect_to root_path 

end 


end 