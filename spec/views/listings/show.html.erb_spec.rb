require "rails_helper"

RSpec.describe "listings/show", type: :view do
  it "renders the listing detail experience" do
    category = Category.create!(title: "Poly Synth")
    user = User.create!(email: "seller@example.com", password: "password")
    user.create_user_info!(country: "Australia", city: "Brisbane", street: "Paddington", postcode: "4064")
    listing = Listing.create!(
      title: "Roland Juno-60",
      description: "Serviced vintage polysynth with chorus and stable tuning.",
      price: 3200,
      availability: true,
      condition: :used,
      category: category,
      user: user
    )

    assign(:listing, listing)
    assign(:related_listings, [])
    assign(:session_id, nil)

    allow(view).to receive(:current_user).and_return(nil)

    render

    expect(rendered).to include("Roland Juno-60")
    expect(rendered).to include("Serviced vintage polysynth")
    expect(rendered).to include("Seller")
    expect(rendered).to include("View seller profile")
  end
end
