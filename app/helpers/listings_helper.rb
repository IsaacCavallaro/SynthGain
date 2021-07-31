module ListingsHelper

    def render_buy_button
        if current_user
            if has_profile
                puts "has_profile"
                button = "<button data-stripe=\"payment\" class=\"btn btn-primary p-3\">Buy: $#{@listing.price}</button>"
            else
                puts "no profile"
                button = link_to  "Buy: $#{@listing.price}", users_info_create_path(current_user.id), class: "btn btn-primary" 
            end
            return button.html_safe
        else 
            controller.redirect_to new_user_registration_path
        end
    end
    def has_profile
        if current_user 
            UserInfo.find_by(user_id:current_user.id)
            # return true
        end
    end
end
