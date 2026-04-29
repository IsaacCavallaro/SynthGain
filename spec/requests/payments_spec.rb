require "rails_helper"

RSpec.describe "Payments", type: :request do
  let(:buyer) { User.create!(email: "buyer@example.com", password: "password") }
  let(:seller) { User.create!(email: "seller@example.com", password: "password") }
  let(:category) { Category.create!(title: "Monosynth") }
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

  it "creates a payment record from a Stripe webhook payload" do
    stripe_payment = double(
      "StripePaymentIntent",
      metadata: OpenStruct.new(listing_id: listing.id, user_id: buyer.id),
      charges: OpenStruct.new(data: [OpenStruct.new(receipt_url: "https://example.com/receipt")])
    )

    allow(Stripe::PaymentIntent).to receive(:retrieve).with("pi_123").and_return(stripe_payment)

    expect do
      post "/payments/webhook", params: {
        data: {
          object: {
            payment_intent: "pi_123"
          }
        }
      }
    end.to change(Payment, :count).by(1)

    expect(response).to have_http_status(:ok)
    expect(Payment.last.listing).to eq(listing)
    expect(Payment.last.user).to eq(buyer)
  end
end
