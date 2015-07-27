# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Plan.create(name: 'Gold', amount: "1000" , description: "expensive")
Plan.create(name: 'Silver', amount: "500" , description: "moderate")
Plan.create(name: 'Bronze', amount: "250" , description: "low")