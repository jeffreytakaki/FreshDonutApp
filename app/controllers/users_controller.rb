class UsersController < ApplicationController
  respond_to :json, :html

    # /users.json
  def index
    @users = @users = User.where("fresh = true")
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

  # def destroy
  #   @user = user.find(params[:id])
  #   @user.destroy
  #   respond_to do |format|
  #     format.html {redirect_to :root}
  #     format.json {render json: {head: :ok}}
  #   end
  # end

  protected

  def user_params
    params.require(:user).permit(:name, :email, :password, :address, :fresh)
  end
end



















# class UsersController < ApplicationController
# 	before_action  :only => [:show, :edit, :update, :destroy]
	
# 	def index
# 		@users = User.all
# 	end

# 	def new
# 		@user = User.new

# 	end

# 	def create
# 		@user = User.new(user_params)
# 		if @user.save
# 			flash[:success] = "Thank you for signing up!"
# 			session[:remember_token] = @user.id
# 			@current_user = @user
# 			redirect_to @user
# 		else
# 			render :new
# 		end
# 	end

# 	def show
# 		@user = User.find(params[:id])
# 		@donut = Donut.new
# 	end


# 	# yelp search api commented out due to scope limitations.
# 	# def search(location, search_term)
#     # parameters = { term: params[:term], limit: 8 }
#        # render :json => Yelp.client.search(location, term: "donuts",limit: 20).businesses
#        # @name = Yelp.client.search(location, term: "donuts",radius_filter: 10,limit: 20).businesses
#     # @city_state_zip = Yelp.client.search(location, term: search_term,limit: 8).businesses[0].location.display_address[2]
#     # @phone = Yelp.client.search(location, term: search_term,limit: 8).businesses[0].phone
#     # @web = Yelp.client.search(location, term: search_term,limit: 8).businesses[0].url
#   	# end

# 	protected

# 	def user_params
#     	params.require(:user).permit(:email, :name, :password)
#   	end
# end