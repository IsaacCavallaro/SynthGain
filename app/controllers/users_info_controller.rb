class UsersInfoController < ApplicationController
  # before_action :user_info_params

  def index
    #Find the current user by id and store in an instance variable
    @user_info = UserInfo.find_by(user_id:current_user.id)
  end

  def show
    # @user_info = UserInfo.find_by(user_id:params[:id])
    @user_info = UserInfo.find(params[:id])
    p @user_info
    p "-------------------------------"
  end

  def new
    #Initiate new user from database
    @user_info = UserInfo.new
  end

  def create
    #Find the user by the current users id
    user = User.find(current_user.id)

    #Initiate a new UserInfo for the current user
    user_info = UserInfo.create!(user:user)

    user_info = user_info.update(user_info_params)
    redirect_to users_info_path
    p user_info_params
    p "-------------------------------"
    p params
  end

  def edit
    # Find the userinfo by the current users id and store in an instance variable
    @user_info = UserInfo.find_by(user_id:current_user.id)
  end

  def update
    # Find the userinfo by the current users id and store in an instance variable
    @user_info = UserInfo.find_by(user_id:current_user.id)
    p "-------------------------------"
    p @user_info
    @user_info = @user_info.update(user_info_params)
    redirect_to users_info_path
  end

  def destroy
  end

  def user_info_params
    params.require(:user_info).permit(:country, :city, :street, :postcode, :picture)
  end
end
