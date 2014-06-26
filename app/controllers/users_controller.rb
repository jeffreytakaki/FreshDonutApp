class UsersController < ApplicationController
  respond_to :json, :html

    # /users.json
  def index
    @users = User.where("fresh = true")
    @donuts = Donut.all
    respond_with @users
  end

  def show
    @user = User.find(params[:id])
	  @donut = Donut.new

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:remember_token] = @user.id
      @current_user = @user
      respond_to do |format|
        format.html {redirect_to @user}
        format.json {render json: @user, status: :created}
      end
    else
      respond_to do |format|
        format.html {redirect_to 'new'}
        format.json {render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  protected

  def user_params
    params.require(:user).permit(:name, :email, :password, :address, :fresh)
  end
end


