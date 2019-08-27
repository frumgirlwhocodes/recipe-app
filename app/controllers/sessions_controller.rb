class SessionsController < ApplicationController 

    skip_before_action :verify_authenticity_token

    def signin 
        @user=User.new 
    end 

    def login_with_auth   
        @user = User.find_by_provider_and_uid(provider: auth['provider'], uid: auth['uid']) 
        || User.create_with_omniauth(auth)
            
          session[:user_id] = @user.id  

      redirect_to user_path(@user), :notice => "Signed in!" 
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

private 

def auth
    request.env['omniauth.auth']
  end
end 


