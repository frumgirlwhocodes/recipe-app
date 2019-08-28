class SessionsController < ApplicationController 

    skip_before_action :verify_authenticity_token

    def signin 
        @user=User.new 
    end 

    def login_with_auth   
      @user = User.from_omniauth(request.env['omniauth.auth'])
      
      if @user.persisted?
       
          session[:user_id] = @user.id  

      redirect_to user_path(@user), :notice => "Signed in!" 
      else 
        session['devise.facebook_data'] = request.env['omniauth.auth']
        redirect_to new_user_path
      end
    end 

    def create 
       
        @user= User.find_by(name: params[:user][:name])
 
   if @user && @user.authenticate(params[:user][:password])
       session[:user_id]=@user.id 
    redirect_to user_path(@user)
   else 
    flash[:errors]= "Incorrect Username and Password"
    render :signin
    end 
end 

def destroy 
session.destroy 
redirect_to root_path 

end 

end 


