require "rails_helper"

RSpec.describe ListingsHelper, type: :helper do
  let(:category) { Category.create!(title: "Poly Synth") }
  let(:seller) { User.create!(email: "seller@example.com", password: "password") }
  let(:buyer) { User.create!(email: "buyer@example.com", password: "password") }
  let(:listing) do
    Listing.create!(
      title: "Roland Juno-60",
      description: "Serviced vintage polysynth with chorus and stable tuning.",
      price: 3200,
      availability: true,
      condition: :used,
      category: category,
      user: seller
    )
  end

  it "asks guests to sign in before purchasing" do
    allow(helper).to receive(:current_user).and_return(nil)

    expect(helper.purchase_cta(listing)).to include("Sign in to buy")
  end

  it "shows ownership state for the seller" do
    allow(helper).to receive(:current_user).and_return(seller)

    expect(helper.purchase_cta(listing)).to include("This is your listing")
  end

  it "prompts buyers to complete their seller profile" do
    allow(helper).to receive(:current_user).and_return(buyer)
    helper.define_singleton_method(:profile_complete?) { false }

    expect(helper.purchase_cta(listing)).to include("Complete seller profile to buy")
  end

  it "shows a Stripe fallback message when checkout is unavailable" do
    allow(helper).to receive(:current_user).and_return(buyer)
    helper.define_singleton_method(:profile_complete?) { true }

    expect(helper.purchase_cta(listing)).to include("Stripe checkout is unavailable in this environment.")
  end
end
