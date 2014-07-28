# task :delete_donuts => :environment do
# 	@donuts_to_destroy = Donut.where("created_at < ?", 1.minutes.ago)
# 	@donuts_to_destroy.destroy_all
# end

task deletedonuts: :environment do
  Donut.where("created_at <= ?", Time.now - 10.seconds).each do |donut|
    donut.destroy
	end
	User.all.each do |user|
		user.update_attributes(fresh: false)
  end
  
end