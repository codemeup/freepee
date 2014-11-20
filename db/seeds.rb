# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
loos = Loo.create([
  {
    name: "Starbucks",
    address: "123 Main Street. San Francisco, CA 00000",
    rating: 0.5,
    handicapped: true,
    baby_changing: true,
    key: true,
    cost: "Customer only",
    stall: "Single Occupancy",
    shower: true,
    toiletries: true,
    venue: "Business"
  },{
    name: "Bay Stree Cafe",
    address: "456 Bay Hay Nay Pay Second Street. San Francisco, CA 00000",
    rating: 0.7,
    handicapped: true,
    baby_changing: false,
    key: true,
    cost: "Customer only",
    stall: "Single Occupancy",
    shower: true,
    toiletries: false,
    venue: "Business"
  }
  ])
