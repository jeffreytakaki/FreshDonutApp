# to delete donuts that are created X time ago. When 
# fresh = false, the icons will disappear. 
task deletedonuts: :environment do
  Donut.where("created_at <= ?", Time.now - 10.seconds).each do |donut|
    donut.destroy
	end
	User.all.each do |user|
		user.update_attributes(fresh: false)
  end
  
end