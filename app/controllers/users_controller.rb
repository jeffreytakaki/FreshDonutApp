class UsersController < ApplicationController
	before_action  :only => [:show, :edit, :update, :destroy]
	
	def index
		@users = User.all
	end

	def new
		@user = User.new

	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Thank you for signing up!"
			session[:remember_token] = @user.id
			@current_user = @user
			redirect_to @user
		else
			render :new
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def search(location, search_term)
    # parameters = { term: params[:term], limit: 8 }
       render :json => Yelp.client.search(location, term: search_term,limit: 8).businesses
    # @city_state_zip = Yelp.client.search(location, term: search_term,limit: 8).businesses[0].location.display_address[2]
    # @phone = Yelp.client.search(location, term: search_term,limit: 8).businesses[0].phone
    # @web = Yelp.client.search(location, term: search_term,limit: 8).businesses[0].url
  	end

	protected

	def user_params
    	params.require(:user).permit(:email, :name, :password)
  	end
end