class ListingsController < ApplicationController
  #Set before action to authenticate_user before accessing the form
  before_action :authenticate_user!, except: [:index, :show]

  before_action :set_listing, only: %i[ show ]

  #Set before ation to allow signed in users to update, edit and delete listings
  before_action :set_user_listing, only: [ :update, :edit, :destroy ]

  #Set before action for setup_form private method only for the new and edit actions
  before_action :setup_form, only: [:new, :edit]

  # GET /listings or /listings.json
  def index
    #retrieve all listings from the database and implement eager loading on pictures and categories
    @listings = Listing.all.with_attached_picture.includes(:category)
    p @listings
  end

  # GET /listings/1 or /listings/1.json
  def show
    stripe_session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      client_reference_id: current_user ? current_user.id : nil,
      customer_email: current_user ? current_user.email : nil,

      line_items: [{
        price_data: {
          unit_amount: @listing.price.to_i * 100,
          currency: 'aud',
          product_data: {
            name: @listing.title,
            description: @listing.description
          },
        },
        quantity: 1
      }],
      payment_intent_data: {
        metadata: {
          listing_id: @listing.id,
          user_id: current_user ? current_user.id : nil
        }
      },
      mode: 'payment',
      success_url: "#{root_url}payments/success?listingId=#{@listing.id}",
      cancel_url: "#{root_url}listings"
    )

    @session_id = stripe_session.id
    pp stripe_session
  end

  # GET /listings/new
  def new
    #initate a new listing and store in an instance variable
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings or /listings.json
  def create

    # Associate user id with creating a listing 
    @listing = current_user.listings.new(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      #Find the id of a Listing object and store in an instance variable
      @listing = Listing.find(params[:id])
    end

    # Connect user id with listing
    def set_user_listing
      #Find the id of a listing associated with the current user and store in an instance variable
      @listing = current_user.listings.find_by_id(params[:id])
      if @listing == nil 
        flash[:alert] = "Access denied"
        redirect_to listings_path
      end
    end

    def setup_form
      #Get all categories from database and store in an instance variable
      @categories = Category.all
      #Get all conditions keys from database and store in an instance variable
      @conditions = Listing.conditions.keys
      #Get all features from database and store in an instance variable
      @features = Feature.all
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:title, :picture, :description, :price, :availability, :condition, :category_id, feature_ids: [])
    end
end
