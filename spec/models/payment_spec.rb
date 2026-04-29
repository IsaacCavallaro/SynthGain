require "rails_helper"

RSpec.describe Payment, type: :model do
  let(:category) { Category.create!(title: "Monosynth") }
  let(:seller) { User.create!(email: "seller@example.com", password: "password") }
  let(:buyer) { User.create!(email: "buyer@example.com", password: "password") }
  let(:listing) do
    Listing.create!(
      title: "Moog Subsequent 37",
      description: "Modern monosynth with strong condition notes and reliable tuning.",
      price: 2800,
      availability: true,
      condition: :used,
      category: category,
      user: seller
    )
  end

  it "requires a unique payment intent id" do
    Payment.create!(
      payment_intent_id: "pi_123",
      receipt_url: "https://example.com/receipt",
      user: buyer,
      listing: listing
    )

    duplicate = Payment.new(
      payment_intent_id: "pi_123",
      receipt_url: "https://example.com/receipt-2",
      user: buyer,
      listing: listing
    )

    expect(duplicate).not_to be_valid
    expect(duplicate.errors[:payment_intent_id]).to include("has already been taken")
  end
end
