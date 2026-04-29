require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  it "formats seller metadata for the UI" do
    user = User.new(email: "isaac.cavallaro@example.com")
    user_info = UserInfo.new(city: "Brisbane", country: "Australia", user: user)

    expect(helper.app_flash_class(:notice)).to eq("flash flash--notice")
    expect(helper.seller_name(user)).to eq("Isaac Cavallaro")
    expect(helper.seller_initials(user)).to eq("IC")
    expect(helper.seller_location(user_info)).to eq("Brisbane, Australia")
  end

  it "returns fallback copy when seller information is missing" do
    expect(helper.app_flash_class(:other)).to eq("flash")
    expect(helper.seller_name(nil)).to eq("Anonymous Seller")
    expect(helper.seller_location(nil)).to eq("Location not provided")
  end

  it "formats listing presentation helpers" do
    listing = Listing.new(price: 3200, condition: "like_new")

    expect(helper.aud_price(listing.price)).to eq("$3,200")
    expect(helper.listing_condition_label(listing)).to eq("Like new")
  end
end
