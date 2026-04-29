require "rails_helper"

RSpec.describe "/listings", type: :request do
  let!(:category) { Category.create!(title: "Poly Synth") }
  let!(:feature) { Feature.create!(title: "MIDI") }
  let(:user) { User.create!(email: "seller@example.com", password: "password") }
  let(:listing) { create_listing(user: user, category: category) }

  def create_listing(user:, category:, overrides: {})
    Listing.create!({
      title: "Roland Juno-60",
      description: "Serviced vintage polysynth with chorus and stable tuning.",
      price: 3200,
      availability: true,
      condition: :used,
      category: category,
      user: user,
      features: [feature]
    }.merge(overrides))
  end

  def valid_params
    {
      title: "Sequential Prophet-6",
      description: "Six-voice analog synth in excellent condition with original box.",
      price: 4100,
      availability: true,
      condition: "like_new",
      category_id: category.id,
      feature_ids: [feature.id]
    }
  end

  it "renders the marketplace index" do
    listing

    get listings_path

    expect(response).to have_http_status(:ok)
    expect(response.body).to include("Explore the latest gear")
    expect(response.body).to include("Roland Juno-60")
  end

  it "renders a listing detail page" do
    get listing_path(listing)

    expect(response).to have_http_status(:ok)
    expect(response.body).to include("Roland Juno-60")
    expect(response.body).to include("Seller")
  end

  it "redirects guests away from the new listing page" do
    get new_listing_path

    expect(response).to redirect_to(new_user_session_path)
  end

  it "lets an authenticated seller create a listing" do
    sign_in user

    expect do
      post listings_path, params: { listing: valid_params }
    end.to change(Listing, :count).by(1)

    expect(response).to redirect_to(listing_path(Listing.last))
    expect(Listing.last.user).to eq(user)
  end

  it "renders validation errors for invalid listing params" do
    sign_in user

    post listings_path, params: {
      listing: valid_params.merge(title: "", description: "too short", category_id: nil)
    }

    expect(response).to have_http_status(:unprocessable_entity)
    expect(response.body).to include("prevented this listing from being saved")
  end

  it "lets the owner update and delete a listing" do
    sign_in user

    patch listing_path(listing), params: {
      listing: valid_params.merge(title: "Roland Juno-106", description: listing.description)
    }
    expect(response).to redirect_to(listing_path(listing))
    expect(listing.reload.title).to eq("Roland Juno-106")

    expect do
      delete listing_path(listing)
    end.to change(Listing, :count).by(-1)

    expect(response).to redirect_to(listings_path)
  end
end
