require 'rails_helper'

describe User do
  before do
    @user = User.create!(name: "Jeffrey's Donuts", email: "jefft@yahoo.com", password: "hello", address: "2356 W 229th Place, Torrance, CA 90501")
  end

     it "should be valid with a name, email, address, and password" do
        expect(@user).to be_valid
    end

    it "should be invalid without a name" do
        @user.name = nil
        expect(@user).to be_invalid
    end

    it "should be invalid without an email" do
        @user.email = nil
        expect(@user).to be_invalid
    end

    it "should be invalid without a password" do
        @user.password = nil
        expect(@user).to be_invalid
    end

    it "should have a unique email" do
        @user3 = User.new(name: "KnifeParty", email: nil, password: "humina", address: "1520 2nd St, Santa Monica, CA 90401", fresh: true)
        @user3.save
        expect(@user3).to be_invalid
    end

    it "should have a unique name" do
        @user4 = User.new(name: nil, email: "CalvinHarris@donuts.com", password: "feelsoclose", address: "1520 2nd St, Santa Monica, CA 90401", fresh: true)
        @user4.save
        expect(@user4).to be_invalid
    end

end