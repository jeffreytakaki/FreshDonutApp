class DonutsController < ApplicationController

  before_action  :only => [:show, :destroy]

  respond_to :json, :html

  def index
    # @donuts = donuts.all
    # respond_with @donuts
  
    # render json for angular when implemented.

    #1  Grab the user's location's coordinates @location


    #2  Then we plug in the @location into the yelp api for the map 
    # @yelpsearch = Yelp.client.search("350 7th St N, Minneapolis, MN", term: "donuts",limit: 40).businesses
      # @yelpsearch = Yelp.client.search(latlng, term: "donuts",limit: 40).businesses

  end

  def fresh
    @donuts = Donut.all
  end

  def show
    @donut = Donut.find(params[:current_user])
    respond_with @donut

  end

  def new
    #user's sessions helper method to identify logged in user. 
    @donut = current_user.donuts.new
  end

  def create
    @donut = current_user.donuts.new(params.require(:donut).permit(:name, :user_id, :fresh))
    @user = current_user
    # @donut.user_id = current_user.id
    # @donuts = Donut.find_by(user_id: current_user.id)
    if @donut.save
      @user.fresh = true
      @user.save
      respond_to do |format|
        format.html { redirect_to current_user }
        # changed to render new instead
        # format.html { redirect_to new_donut_path }
        format.json { render json: @user, status: :created }
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    @donut.destroy

    respond_to do |format|
      format.html { redirect_to users_path }
      format.json { render json: { head: :ok } }
    end
  end
end
