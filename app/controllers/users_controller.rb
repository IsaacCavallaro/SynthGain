class UsersController < ApplicationController
    def show
        #Find the user id and store in an instance variable
        @user = User.find(params[:id])
        @user_listings = @user.listings
    end

    def new
        # Override Devise default behaviour and create a profile as well
        build_resource({})
        resource.build_user_info
        respond_with self.resource
    end

    # private
    # def user_params
    #     devise_parameter_sanitizer.permit(:sign_up) { |u|
    #       u.require(:user).permit(:username, :password, :email, user_info_attributes: [:country, :city, :street, :postcode])
    #     }
    # end
end
