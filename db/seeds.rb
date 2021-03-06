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
    title: "Wonder Synth",
    description: "This synth is truly wonderful",
    price: 1.00,
    condition: 1,
    category_id: 1,
    user_id: 1,
    availability: true)

    listing1.picture.attach(
        io: File.open("app/assets/images/testsythn1.jpg"),
        filename: "testsythn1.jpg",
        content_type: "image/jpg")

########### Create listing with user 2 ###############
listing2 = Listing.create!(
    title: "Ultra Synth",
    description: "Ultra synth will bring the ultra to your life",
    price: 2.00,
    condition: 1,
    category_id: 2,
    user_id: 2,
    availability: true)
        
    listing2.picture.attach(
        io: File.open("app/assets/images/testsythn2.jpg"),
        filename: "testsythn2.jpg",
        content_type: "image/jpg")

########### Create listing with user 3 ###############
listing3 = Listing.create!(
    title: "Silly Synth",
    description: "A silly synth will go a long way to make your life better",
    price: 3.00,
    condition: 1,
    category_id: 3,
    user_id: 3,
    availability: true)
        
    listing3.picture.attach(
        io: File.open("app/assets/images/testsythn5.jpg"),
        filename: "testsythn5.jpg",
        content_type: "image/jpg")

########### User Faker to create listings ###############
10.times do |x|
    faker = Listing.create!(title: Faker::Drone.name, 
        description: Faker::Lorem.sentences(number:1),price: (1..100).to_a.sample, category_id: (1..3).to_a.sample, user_id: (1..3).to_a.sample, condition: (1..2).to_a.sample, availability: true)
    
        faker.picture.attach(
            io: File.open("app/assets/images/testsythn3.jpg"),
            filename: "testsythn3.jpg",
            content_type: "image/jpg")
end
