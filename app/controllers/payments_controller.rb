class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]
  before_action :authenticate_user!, only: [:success, :orders]

  def webhook
    payment_intent_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_intent_id)

    listing_id = payment.metadata.listing_id
    buyer_id = payment.metadata.user_id
    receipt_url = payment.charges.data[0].receipt_url

    Payment.find_or_create_by!(payment_intent_id: payment_intent_id) do |purchase|
      purchase.user_id = buyer_id
      purchase.listing_id = listing_id
      purchase.receipt_url = receipt_url
    end

    head :ok
  end

  def success
    listing_id = params[:listingId]
    @listing = Listing.find(listing_id)
    @purchase = current_user.payments.find_by(listing_id: listing_id)
  end

  def orders
    @orders = current_user.payments.includes(:listing).order(created_at: :desc)
  end
end
