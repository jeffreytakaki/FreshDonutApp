class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :address, :latitude, :longitude, :fresh

  has_many :donuts
end
