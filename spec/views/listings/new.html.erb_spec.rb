require "rails_helper"

RSpec.describe "listings/new", type: :view do
  it "renders the new listing form" do
    category = Category.create!(title: "Poly Synth")

    assign(:listing, Listing.new)
    assign(:categories, [category])
    assign(:conditions, Listing.conditions.keys)
    assign(:features, [])

    render

    assert_select "form[action=?][method=?]", listings_path, "post" do
      assert_select "input[name=?]", "listing[title]"
      assert_select "textarea[name=?]", "listing[description]"
      assert_select "select[name=?]", "listing[category_id]"
      assert_select "input[name=?]", "listing[price]"
      assert_select "select[name=?]", "listing[availability]"
      assert_select "input[name=?]", "listing[condition]"
    end
  end
end
