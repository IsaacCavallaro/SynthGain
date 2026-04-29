categories = [
  ["Polyphonic", "Layered pads, lush chords, and classic ensemble synth textures."],
  ["Monophonic", "Lead and bass instruments built for focused analogue character."],
  ["Modular", "Patchable systems for people who want open-ended sound design."]
]

features = ["Weighted Keys", "Arpeggiator", "Vocoder", "MIDI", "Serviced Recently"]

categories.each do |title, description|
  Category.find_or_create_by!(title: title) do |category|
    category.description = description
  end
end

features.each do |title|
  Feature.find_or_create_by!(title: title)
end

users = [
  {
    email: "test@test.com",
    password: "testing",
    profile: { country: "Australia", city: "Brisbane", street: "Paddington", postcode: "4064", picture: "user1picture.jpg" }
  },
  {
    email: "mrtest@test.com",
    password: "testing",
    profile: { country: "Australia", city: "Melbourne", street: "Brunswick East", postcode: "3057", picture: "user2picture.jpg" }
  },
  {
    email: "mrstest@test.com",
    password: "testing",
    profile: { country: "Australia", city: "Sydney", street: "Newtown", postcode: "2042", picture: "user3picture.jpg" }
  }
]

users.each do |entry|
  user = User.find_or_create_by!(email: entry[:email]) do |record|
    record.password = entry[:password]
    record.password_confirmation = entry[:password]
  end

  user_info = user.user_info || user.build_user_info
  user_info.assign_attributes(entry[:profile].except(:picture))
  user_info.save!

  next if user_info.picture.attached?

  user_info.picture.attach(
    io: File.open(Rails.root.join("app/assets/images", entry[:profile][:picture])),
    filename: entry[:profile][:picture],
    content_type: "image/jpg"
  )
end

sample_listings = [
  {
    title: "Roland Juno-60",
    description: "Well-maintained Juno-60 with strong chorus, stable tuning, and excellent cosmetic condition for its age.",
    price: 3400,
    condition: :like_new,
    category: "Polyphonic",
    user_email: "test@test.com",
    image: "testsythn1.jpg",
    feature_titles: ["Arpeggiator", "Serviced Recently"]
  },
  {
    title: "Moog Source",
    description: "Classic mono synth with a warm ladder filter, responsive controls, and a recent service history.",
    price: 2900,
    condition: :used,
    category: "Monophonic",
    user_email: "mrtest@test.com",
    image: "testsythn2.jpg",
    feature_titles: ["MIDI"]
  },
  {
    title: "Doepfer A-100 Rack",
    description: "A compact modular starter rig with a practical mix of utility, sequencing, and tonal modules.",
    price: 1800,
    condition: :used,
    category: "Modular",
    user_email: "mrstest@test.com",
    image: "testsythn5.jpg",
    feature_titles: ["Serviced Recently"]
  }
]

sample_listings.each do |entry|
  listing = Listing.find_or_initialize_by(title: entry[:title])
  listing.assign_attributes(
    description: entry[:description],
    price: entry[:price],
    condition: Listing.conditions.fetch(entry[:condition].to_s),
    category: Category.find_by!(title: entry[:category]),
    user: User.find_by!(email: entry[:user_email]),
    availability: true
  )
  listing.save!

  entry[:feature_titles].each do |feature_title|
    listing.features << Feature.find_by!(title: feature_title) unless listing.features.exists?(title: feature_title)
  end

  next if listing.picture.attached?

  listing.picture.attach(
    io: File.open(Rails.root.join("app/assets/images", entry[:image])),
    filename: entry[:image],
    content_type: "image/jpg"
  )
end

10.times do
  listing = Listing.create!(
    title: Faker::Music.instrument,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    price: rand(900..4200),
    category: Category.order("RANDOM()").first,
    user: User.order("RANDOM()").first,
    condition: Listing.conditions.keys.sample,
    availability: true
  )

  listing.picture.attach(
    io: File.open(Rails.root.join("app/assets/images/testsythn3.jpg")),
    filename: "testsythn3.jpg",
    content_type: "image/jpg"
  )
end
