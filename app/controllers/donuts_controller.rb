class DonutsController < ApplicationController

  before_action  :only => [:show, :destroy]

  respond_to :json, :html

  def index
    # @donuts = donuts.all
    # respond_with @donuts
  end

  def show
    respond_with @donut
  end

  def new
    #user's sessions helper method to identify logged in user. 
    @donut = current_user.donuts.new
  end

  def create
    @donut = current_user.donuts.new(params.require(:donut).permit(:name, :user_id))

    if @donut.save
      respond_to do |format|
        # format.html { redirect_to current_user }
        # changed to render new instead
        format.html { redirect_to new_donut_path }
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
