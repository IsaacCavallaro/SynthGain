# require 'faker'

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

#Seed database with 3 users if the count is 0
if User.count == 0 
    ########### Create user 1 ###############
    User.create!(email: "test@test.com", password: "testing", password_confirmation: "testing")
    
    ########### Create user 1 profile ###############
    userinfo1 = UserInfo.create!(country: "Australia", city: "Brisbane", street: "Zigzag", postcode: "1111", user_id: 1)
    
    ########### Create user 1 profile image ###############
        userinfo1.picture.attach(
                io: File.open("app/assets/images/user1picture.jpg"),
                filename: "user1picture.jpg",
                content_type: "image/jpg")


    ########### Create user 2 ###############
    User.create!(email: "mrtest@test.com", password: "testing", password_confirmation: "testing")
    
    ########### Create user 2 profile ###############
    userinfo2 = UserInfo.create!(country: "Australia", city: "Brisbane", street: "Zagzig", postcode: "2222", user_id: 2)

    ########### Create user 2 profile image ###############
    userinfo2.picture.attach(
        io: File.open("app/assets/images/user2picture.jpg"),
        filename: "user2picture.jpg",
        content_type: "image/jpg")

    ########### Create user 3 ###############
    User.create!(email: "mrstest@test.com", password: "testing", password_confirmation: "testing")
    
    ########### Create user 3 profile ###############
    userinfo2 = UserInfo.create!(country: "Australia", city: "Brisbane", street: "Zoozag", postcode: "3333", user_id: 3)

    ########### Create user 3 profile image ###############
    userinfo2.picture.attach(
        io: File.open("app/assets/images/user3picture.jpg"),
        filename: "user2picture.jpg",
        content_type: "image/jpg")

end


########### Create listings ###############

########### Create listing with user 1 ###############
listing1 = Listing.create!(
    title: "Synth",
    description: "Listing 1 synth",
    price: 1.00,
    condition: 1,
    category_id: 1,
    user_id: 1)

    listing1.picture.attach(
        io: File.open("app/assets/images/testsythn1.jpg"),
        filename: "testsythn1.jpg",
        content_type: "image/jpg")

########### Create listing with user 2 ###############
listing2 = Listing.create!(
    title: "Synth 2",
    description: "Listing 2 synth",
    price: 1.00,
    condition: 1,
    category_id: 1,
    user_id: 2)
        
    listing2.picture.attach(
        io: File.open("app/assets/images/testsythn2.jpg"),
        filename: "testsythn2.jpg",
        content_type: "image/jpg")

########### Create listing with user 3 ###############
listing2 = Listing.create!(
    title: "Synth 2",
    description: "Listing 2 synth",
    price: 1.00,
    condition: 1,
    category_id: 1,
    user_id: 3)
        
    listing2.picture.attach(
        io: File.open("app/assets/images/testsythn3.jpg"),
        filename: "testsythn3.jpg",
        content_type: "image/jpg")



        # 10.times do
        #     User.create!(
        #           email: Faker::Internet.email,
        #           password: "123456"
        #        )
        # end