module ListingsHelper

    def render_buy_button
        if current_user
            button = "<button data-stripe=\"payment\" class=\"btn btn-primary p-3\">Buy: $#{@listing.price}</button>"
        else
            button = "<button class=\"btn btn-secondary\" disabled>Log In to Buy</button>"
        end
        return button.html_safe
    end

end