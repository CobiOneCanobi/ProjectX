# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#######################
## Non-Production Data
#######################
unless Rails.env.production? || Rails.env.staging? || Rails.env.qa? || Rails.env.test?

  require 'factory_girl_rails'
  require 'faker'
  require 'csv'

  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  User.create!(username: 'Yoda', email: 'user@example.com', password: 'password', password_confirmation: 'password')

  ############
  # Categories
  ############

  puts "***** Seeding Categories"
  categories = CSV.read "#{ Rails.root }/db/seeds/categories.csv"
  categories.shift # Skip header
  categories.each do |category|
    Category.create name: category[0].strip
  end


  ##############
  # Users
  ##############

  # These accounts are not meant to be logged in directly
  puts "***** Seeding Users"
  num_users = rand(25..50)
  FactoryGirl.create_list :user, num_users


  ############
  # Presentation
  ############

  puts "***** Seeding Presentations"
  User.find_each do |user|
    num_presentations = rand(0..2)
    FactoryGirl.create_list :presentation, num_presentations, user: user
  end


  ############
  # Feedback
  ############

  puts "***** Seeding Feedbacks"
  Presentation.find_each do |presentation|
    num_feedback = rand(0..5)
    FactoryGirl.create_list :feedback, num_feedback, presentation: presentation
  end

  puts "***** Created #{ User.all.size } User"
  puts "***** Created #{ Presentation.all.size } Presentation"
  puts "***** Created #{ Feedback.all.size } Feedback"
  puts "***** Created #{ Category.all.size } Category"

end