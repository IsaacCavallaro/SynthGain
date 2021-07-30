class CartsController < ApplicationController
    # before_action only: [:create]

    def index
        @my_cart = current_user.cart.cart_listings
    end
    
    def create
        # @my_cart = Cart.where(user:current_user)
    end
    
    def show

    end
    
    def cart_total
        # sum = 0
        # @cart.each do |cart_item|
        # sum += cart_item.price
        # end
        # return sum
    end
    
end

# When the user clicks add to card, I want to add the listing to the cart and redirect them to the cart page
# They can then go back to viewing listing and continue adding to cart

