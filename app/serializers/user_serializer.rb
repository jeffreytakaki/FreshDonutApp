class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :address, :latitude, :longitude

  has_many :donuts
end
