require "rails_helper"

RSpec.describe Listing, type: :model do
  let(:category) { Category.create!(title: "Poly Synth") }
  let(:user) { User.create!(email: "seller@example.com", password: "password") }

  it "validates its core marketplace fields" do
    listing = Listing.new(category: category, user: user)

    expect(listing).not_to be_valid
    expect(listing.errors[:title]).to include("can't be blank")
    expect(listing.errors[:price]).to include("can't be blank")
    expect(listing.errors[:description]).to include("can't be blank")
    expect(listing.errors[:availability]).to include("is not included in the list")
    expect(listing.errors[:condition]).to include("can't be blank")
  end

  it "accepts both availability states but rejects nil" do
    expect(
      Listing.new(
        title: "Roland Juno-60",
        description: "Serviced vintage polysynth with chorus and stable tuning.",
        price: 3200,
        availability: false,
        condition: :used,
        category: category,
        user: user
      )
    ).to be_valid

    expect(
      Listing.new(
        title: "Roland Juno-60",
        description: "Serviced vintage polysynth with chorus and stable tuning.",
        price: 3200,
        availability: nil,
        condition: :used,
        category: category,
        user: user
      )
    ).not_to be_valid
  end

  it "strips surrounding whitespace before save" do
    listing = Listing.create!(
      title: "  Roland Juno-60  ",
      description: "  Serviced vintage polysynth with chorus and stable tuning.  ",
      price: 3200,
      availability: true,
      condition: :used,
      category: category,
      user: user
    )

    expect(listing.title).to eq("Roland Juno-60")
    expect(listing.description).to eq("Serviced vintage polysynth with chorus and stable tuning.")
  end

  it "exposes the availability and recency scopes" do
    available_listing = Listing.create!(
      title: "Roland Juno-60",
      description: "Serviced vintage polysynth with chorus and stable tuning.",
      price: 3200,
      availability: true,
      condition: :used,
      category: category,
      user: user
    )
    unavailable_listing = Listing.create!(
      title: "Korg Mono/Poly",
      description: "Classic synth with clear ownership history and recent servicing.",
      price: 2600,
      availability: true,
      condition: :needs_repair,
      category: category,
      user: user
    )
    unavailable_listing.update_column(:availability, false)

    expect(Listing.available).to contain_exactly(available_listing)
    expect(Listing.recent_first.first).to eq(unavailable_listing)
  end
end
