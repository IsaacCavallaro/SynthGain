class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  def webhook
    payment_intent_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_intent_id)

    listing_id = payment.metadata.listing_id
    buyer_id = payment.metadata.user_id

    receipt_url = payment.charges.data[0].receipt_url
  end
end
