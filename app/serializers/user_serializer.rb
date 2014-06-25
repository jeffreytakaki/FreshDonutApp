class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :address, :latitude, :longitude
end
