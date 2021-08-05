class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  def webhook
    payment_intent_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_intent_id)

    listing_id = payment.metadata.listing_id
    buyer_id = payment.metadata.user_id
    

    p "---------------receipt------------------"
    receipt_url = payment.charges.data[0].receipt_url

    p receipt_url

    Payment.create(user_id: buyer_id, listing_id: listing_id, payment_intent_id: payment_intent_id, receipt_url: receipt_url)

    p params
    p "---------------test-------------------"
   
    puts "test"

  end

  def success
    listing_id = params[:listingId]
    @listing = Listing.find(listing_id)
    purchase = Payment.where(listing_id: params[:listingId])
    p "----------------------------------"
    p purchase
  end

end
