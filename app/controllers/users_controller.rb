class UsersController < ApplicationController
	before_action  :only => [:show, :edit, :update, :destroy]

  	respond_to :json, :html
	
	def index
		@users = User.all
		respond_with @users
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

		# beginning of angular json
	    if @user.save
	      respond_to do |format|
	        format.html { redirect_to users_path }
	        format.json { render json: @user, status: :created }
	      end
	    else
	      respond_to do |format|
	        format.html { render 'new' }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
   		# end of angular json	
	end

	def show
		@user = User.find(params[:id])
	end

	# def edit
	# 	@user = User.find(params[:id])
	# end

	# def update
	# 	@user = User.find(params[:id])
	# 	if @user.update(params.require(:user).permit(:name, :email))
	# 		redirect_to users_path
	# 	else
	# 		render 'edit'
	# 	end
	# end

	def destroy
		User.find(params[:id]).destroy
		redirect_to users_path
	  
    end
	end

	def search(location, search_term)
    # parameters = { term: params[:term], limit: 8 }
    @name = Yelp.client.search("los angeles", term: "cars",limit: 8).businesses[0].name
    @street = Yelp.client.search(location, term: search_term,limit: 8).businesses[0].location.display_address[0]
    @city_state_zip = Yelp.client.search(location, term: search_term,limit: 8).businesses[0].location.display_address[2]
    @phone = Yelp.client.search(location, term: search_term,limit: 8).businesses[0].phone
    @web = Yelp.client.search(location, term: search_term,limit: 8).businesses[0].url
  end

	protected

	def user_params
    	params.require(:user).permit(:email, :name, :password)
  	end
end