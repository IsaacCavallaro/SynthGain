require "rails_helper"

RSpec.describe "Buyers", type: :request do
  let(:category) { Category.create!(title: "Poly Synth") }
  let(:user) { User.create!(email: "seller@example.com", password: "password") }

  it "renders the marketplace browse page" do
    Listing.create!(
      title: "Roland Juno-60",
      description: "Serviced vintage polysynth with chorus and stable tuning.",
      price: 3200,
      availability: true,
      condition: :used,
      category: category,
      user: user
    )

    get buyers_path

    expect(response).to have_http_status(:ok)
    expect(response.body).to include("Synths for sale")
    expect(response.body).to include("Roland Juno-60")
  end

  it "applies category filters through Ransack" do
    matching_category = category
    other_category = Category.create!(title: "Monosynth")
    Listing.create!(
      title: "Roland Juno-60",
      description: "Serviced vintage polysynth with chorus and stable tuning.",
      price: 3200,
      availability: true,
      condition: :used,
      category: matching_category,
      user: user
    )
    Listing.create!(
      title: "Moog Subsequent 37",
      description: "Modern monosynth with strong condition notes and reliable tuning.",
      price: 2800,
      availability: true,
      condition: :used,
      category: other_category,
      user: user
    )

    get buyers_path, params: { q: { category_id_eq: matching_category.id } }

    expect(response).to have_http_status(:ok)
    expect(response.body).to include("Roland Juno-60")
    expect(response.body).not_to include("Moog Subsequent 37")
  end
end
