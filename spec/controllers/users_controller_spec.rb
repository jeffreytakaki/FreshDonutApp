require 'rails_helper'

describe UsersController do 
	
	let :valid_attributes do
		{
			:name => "Jeffrey"
		}
	end

	describe "GET index" do
		before do
			get :index
		end

		it "should render the index template" do
			expect(response).to render_template :index
		end
	end

	describe "GET new" do
		before do
			get :new
		end


		it "should render the new template" do
			expect(response).to render_template :new
		end
	end

	describe "POST create" do
	    describe "successful create" do
	     it "should create a user in the database" do
	        expect do
	          post :create, user: valid_attributes
	        end
	     end
  	    end
	end
end
