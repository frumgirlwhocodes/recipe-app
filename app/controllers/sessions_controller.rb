class SessionsController < ApplicationController 

    def signin 
        @user=User.new 

    end 
    def login_with_auth   
        auth = request.env["omniauth.auth"]    
         @user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || 
         User.create_with_omniauth(auth)  
            session[:user_id] = @user.id   
      redirect_to root_url, :notice => "Signed in!" 
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

def destroy 
session.destroy 
redirect_to root_path 

end 


end 