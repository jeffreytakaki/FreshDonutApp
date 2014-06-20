# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	DonutType.destroy_all

	DonutType.create!(kind: "Plain Cake");
	DonutType.create!(kind: "Strawberry Frosted Cake");
	DonutType.create!(kind: "Chocolate Frosted Cake");
	DonutType.create!(kind: "Glazed Original");
	DonutType.create!(kind: "Glazed Twist");
	DonutType.create!(kind: "Maple Bar");
	DonutType.create!(kind: "Long John");
	DonutType.create!(kind: "Blueberry");
	DonutType.create!(kind: "French Cruller");
	DonutType.create!(kind: "Sprinkles");