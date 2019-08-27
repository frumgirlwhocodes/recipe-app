class SessionsController < ApplicationController 

    skip_before_action :verify_authenticity_token

    def signin 
        @user=User.new 
    end 
    def login_with_auth   
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
          end
      
          session[:user_id] = @user.id
          @auth = auth
          

      redirect_to root_path, :notice => "Signed in!" 
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


