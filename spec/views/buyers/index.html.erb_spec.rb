require "rails_helper"

RSpec.describe "buyers/index.html.erb", type: :view do
  it "renders marketplace filters and listing cards" do
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

    assign(:q, Listing.ransack({}))
    assign(:categories, [category])
    assign(:listings, [listing])

    render

    expect(rendered).to include("Synths for sale")
    expect(rendered).to include("Apply filters")
    expect(rendered).to include("Roland Juno-60")
  end
end
