require "rails_helper"

RSpec.describe "listings/index", type: :view do
  it "renders marketplace cards for listings" do
    category = Category.create!(title: "Poly Synth")
    user = User.create!(email: "seller@example.com", password: "password")

    assign(:listings, [
      Listing.create!(
        title: "Roland Juno-60",
        description: "Serviced vintage polysynth with chorus and stable tuning.",
        price: 3200,
        availability: true,
        condition: :used,
        category: category,
        user: user
      ),
      Listing.create!(
        title: "Sequential Prophet-6",
        description: "Six-voice analog synth in excellent condition with flight case.",
        price: 4100,
        availability: true,
        condition: :like_new,
        category: category,
        user: user
      )
    ])

    allow(view).to receive(:user_signed_in?).and_return(false)

    render

    expect(rendered).to include("Explore the latest gear")
    expect(rendered).to include("Roland Juno-60")
    expect(rendered).to include("Sequential Prophet-6")
  end
end
