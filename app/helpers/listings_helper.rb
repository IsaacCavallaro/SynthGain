module ListingsHelper

    def render_buy_button
        #if the user has a login account!
        if current_user
            #if the user has a login account and DOES have profile/userinfo!
            if has_profile
                puts "has_profile"
                button = "<button data-stripe=\"payment\" class=\"btn btn-primary p-3\">Buy: $#{@listing.price}</button>"
            else
               #if the user has a login account and does NOT have a profile/userinfo
                puts "no profile"
                button = link_to  "Buy: $#{@listing.price}", users_info_new_path(current_user.id), class: "btn btn-primary" 
            end
            return button.html_safe
        else 
            #if user does not have a login account! 
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
