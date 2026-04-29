require "rails_helper"

RSpec.describe "UsersInfos", type: :request do
  let(:user) { User.create!(email: "profile@example.com", password: "password") }

  it "redirects guests away from the private profile dashboard" do
    get users_info_path

    expect(response).to redirect_to(new_user_session_path)
  end

  it "redirects signed-in users without a profile to the profile form" do
    sign_in user

    get users_info_path

    expect(response).to redirect_to(users_info_new_path(user.id))
  end

  it "shows the seller dashboard when a profile exists" do
    sign_in user
    user.create_user_info!(country: "Australia", city: "Brisbane", street: "Paddington", postcode: "4064")

    get users_info_path

    expect(response).to have_http_status(:ok)
    expect(response.body).to include("Your profile")
  end

  it "creates a seller profile" do
    sign_in user

    expect do
      post users_info_create_path, params: {
        user_info: {
          country: "Australia",
          city: "Brisbane",
          street: "Paddington",
          postcode: "4064"
        }
      }
    end.to change(UserInfo, :count).by(1)

    expect(response).to redirect_to(users_info_path)
  end

  it "renders a public seller profile" do
    user_info = user.create_user_info!(country: "Australia", city: "Brisbane", street: "Paddington", postcode: "4064")

    get users_info_show_profile_path(user.id)

    expect(response).to have_http_status(:ok)
    expect(response.body).to include(user_info.city)
  end
end
