# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Set the categories for the category entity
categories = ["Polyphonic", "Monophonic", "Modular"]

#Set the features for the feature entity
features = ["Weighted Keys", "Arpeggiator", "Vocodor"]

#Seed database if the category count is 0
if Category.count == 0
    #iterate through categories
    categories.each do |category|
        #Create a title and description for each category
        Category.create(title: category, description: "This is a test description")
        #print to console
        puts "Created #{category} category"
    end
end

#Seed database if the feature count is 0
if Feature.count == 0
    #iterate through features
    features.each do |feature|
        #Create a title for features
        Feature.create(title: feature)
        #print to console
        puts "Created #{feature} feature"
    end
end

#Seed database with user if the count is 0
if User.count == 0 
    User.create(email: "test@test.com", password: "testing", password_confirmation: "testing")
end


