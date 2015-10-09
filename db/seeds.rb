# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



# 	Plan.destroy_all
# 	ActiveRecord::Base.connection.execute("TRUNCATE plans RESTART IDENTITY cascade")

if Plan.all.first.nil?
	Plan.create!(name: 'Annual - Auto Renew', amount: "1900" , description: "Annual Plan and Auto Renew on yearly basis", subscription_period: 12)
	Plan.create!(name: 'Lifetime', amount: "9900" , description: "Annual Plan and lifetime membership", subscription_period: 360)
else
	Plan.find(1).update_attributes!(:description => 'Annual Plan with Auto Renew on yearly basis')
	Plan.find(2).update_attributes!(:name =>'Lifetime',:description => 'Lifetime Membership (20 years)')
end