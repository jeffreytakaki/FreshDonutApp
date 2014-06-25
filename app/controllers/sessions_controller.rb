class SessionsController < ApplicationController
  
  def new
  end

  def create
  	@user = User.where(email: params[:session][:email]).first
		
		if @user == nil || !@user.authenticate(params[:session][:password])
			flash[:error] = "Please try logging in again"
			render 'new'
		else
			session[:remember_token] = @user.id
			@current_user = @user
      redirect_to user_path
		end
  end

  def destroy
  	session.delete(:remember_token)
    redirect_to donuts_path
  end
end