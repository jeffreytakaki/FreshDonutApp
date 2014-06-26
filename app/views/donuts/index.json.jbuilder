json.donuts do |json|

	json.array!(@donuts) do |spot|
	  json.extract! donut, :id, :latitude, :longitude, :address, :description, :title
	  json.url donut_url(donut, format: :json)
	end
end