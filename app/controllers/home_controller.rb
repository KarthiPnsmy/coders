class HomeController < ApplicationController
  def index
    @user = User.new
  end

  def login
  end

  def authenticate
    @user=User.find_by_name_and_password(params[:user_name],params[:password])
    
    if @user
      session[:user]=@user.id
      session[:permission]=@user.permission
      redirect_to (@user,:notice => "User #{@user.name}  Loggedin")
    else
      flash[:notice] = "User name or Password is wrong"
      redirect_to :back
    end
  end

def logout
      session[:user]=nil
      flash[:notice] = "Successfully logedout"
      redirect_to :controller => "home", :action => "index"
end

end
