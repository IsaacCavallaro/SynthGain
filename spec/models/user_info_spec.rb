require "rails_helper"

RSpec.describe UserInfo, type: :model do
  let(:user) { User.create!(email: "profile@example.com", password: "password") }

  it "requires location fields for seller trust" do
    user_info = UserInfo.new(user: user)

    expect(user_info).not_to be_valid
    expect(user_info.errors[:country]).to include("can't be blank")
    expect(user_info.errors[:city]).to include("can't be blank")
    expect(user_info.errors[:street]).to include("can't be blank")
    expect(user_info.errors[:postcode]).to include("can't be blank")
  end
end
