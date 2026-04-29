require "rails_helper"

RSpec.describe "pages/home.html.erb", type: :view do
  it "renders the recruiter-facing landing page and featured listing" do
    category = Category.create!(title: "Poly Synth")
    user = User.create!(email: "seller@example.com", password: "password")
    listing = Listing.create!(
      title: "Roland Juno-60",
      description: "Serviced vintage polysynth with chorus and stable tuning.",
      price: 3200,
      availability: true,
      condition: :used,
      category: category,
      user: user
    )

    assign(:featured_listings, [listing])

    render

    expect(rendered).to include("Buy and sell vintage synthesizers")
    expect(rendered).to include("Fresh listings from the community")
    expect(rendered).to include("Roland Juno-60")
  end
end
