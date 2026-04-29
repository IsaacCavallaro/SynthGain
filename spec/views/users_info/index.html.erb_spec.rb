require "rails_helper"

RSpec.describe "users_info/index.html.erb", type: :view do
  it "renders the signed-in seller profile dashboard" do
    user = User.create!(email: "seller@example.com", password: "password")
    user_info = user.create_user_info!(country: "Australia", city: "Brisbane", street: "Paddington", postcode: "4064")

    assign(:user_info, user_info)
    allow(view).to receive(:current_user).and_return(user)

    render

    expect(rendered).to include("Your profile")
    expect(rendered).to include("Brisbane")
    expect(rendered).to include("Edit profile")
  end
end
