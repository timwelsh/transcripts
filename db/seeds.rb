# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Plan.create!(name: 'Annual - Auto Renew', amount: "1900" , description: "Annual Plan and Auto Renew on yearly basis", subscription_period: 12)
Plan.create!(name: 'Annual Lifetime', amount: "9900" , description: "Annual Plan and lifetime membership", subscription_period: 360)
