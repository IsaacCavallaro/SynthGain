require "rails_helper"

RSpec.describe "Pages", type: :request do
  it "renders the home page" do
    get root_path

    expect(response).to have_http_status(:ok)
    expect(response.body).to include("SynthGain")
  end

  it "renders the about page" do
    get "/pages/about"

    expect(response).to have_http_status(:ok)
  end
end
