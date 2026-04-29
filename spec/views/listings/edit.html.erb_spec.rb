require "rails_helper"

RSpec.describe "listings/edit", type: :view do
  it "renders the edit listing form" do
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

    assign(:listing, listing)
    assign(:categories, [category])
    assign(:conditions, Listing.conditions.keys)
    assign(:features, [])

    render

    assert_select "form[action=?][method=?]", listing_path(listing), "post" do
      assert_select "input[name=?]", "listing[title]"
      assert_select "textarea[name=?]", "listing[description]"
      assert_select "select[name=?]", "listing[category_id]"
      assert_select "input[name=?]", "listing[price]"
      assert_select "select[name=?]", "listing[availability]"
      assert_select "input[name=?]", "listing[condition]"
    end
  end
end
