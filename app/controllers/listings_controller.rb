class ListingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_listing, only: %i[show edit update destroy]
  before_action :set_user_listing, only: %i[edit update destroy]
  before_action :setup_form, only: %i[new create edit update]

  def index
    @listings = Listing.with_attached_picture.includes(:category, :features, :user).recent_first
  end

  def show
    @related_listings = Listing.available
      .where(category_id: @listing.category_id)
      .where.not(id: @listing.id)
      .with_attached_picture
      .includes(:category, :user)
      .recent_first
      .limit(3)

    @session_id = build_checkout_session_id if purchase_available?
  end

  def new
    @listing = Listing.new
  end

  def edit
  end

  def create
    @listing = current_user.listings.new(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: "Listing created successfully." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: "Listing updated successfully." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to listings_url, notice: "Listing deleted." }
      format.json { head :no_content }
    end
  end

  private
  def set_listing
    @listing = Listing.find(params[:id])
  end

  def set_user_listing
    @listing = current_user.listings.find_by(id: params[:id])
    return if @listing.present?

    redirect_to listings_path, alert: "You do not have access to edit that listing."
  end

  def setup_form
    @categories = Category.order(:title)
    @conditions = Listing.conditions.keys
    @features = Feature.order(:title)
  end

  def listing_params
    params.require(:listing).permit(
      :title,
      :picture,
      :description,
      :price,
      :availability,
      :condition,
      :category_id,
      feature_ids: []
    )
  end

  def purchase_available?
    current_user.present? &&
      current_user.id != @listing.user_id &&
      stripe_public_key.present? &&
      stripe_secret_key.present?
  end

  def stripe_public_key
    Rails.application.credentials.dig(:stripe, :public_key)
  end

  def stripe_secret_key
    Rails.application.credentials.dig(:stripe, :secret_key)
  end

  def build_checkout_session_id
    stripe_session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      client_reference_id: current_user.id,
      customer_email: current_user.email,
      line_items: [
        {
          price_data: {
            unit_amount: (@listing.price * 100).to_i,
            currency: "aud",
            product_data: {
              name: @listing.title,
              description: @listing.description
            }
          },
          quantity: 1
        }
      ],
      payment_intent_data: {
        metadata: {
          listing_id: @listing.id,
          user_id: current_user.id
        }
      },
      mode: "payment",
      success_url: payments_success_url(listingId: @listing.id),
      cancel_url: listing_url(@listing)
    )

    stripe_session.id
  rescue Stripe::StripeError => e
    Rails.logger.error("Unable to create Stripe checkout session for listing #{@listing.id}: #{e.message}")
    nil
  end
end
