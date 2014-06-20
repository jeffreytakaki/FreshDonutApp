class DonutTypesController < ApplicationController
  
  def index
  	@donuttypes = DonutType.all
  end

  def show
  end

  def new
  end

  def create
  end

end
