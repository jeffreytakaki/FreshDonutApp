json.users do |json|

	json.array!(@users) do |users|
	  json.extract! users, :id, :latitude, :longitude, :address, :name, :email
	  json.url users_url(users, format: :json)
	end
end