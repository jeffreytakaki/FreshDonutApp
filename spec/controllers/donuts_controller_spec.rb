require 'rails_helper'

describe UsersController do 

	describe "GET index" do
		before do
			get :index
		end

		it "should render the index template" do
			expect(response).to render_template :index
		end
	end
end
