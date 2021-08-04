class UsersInfoController < ApplicationController
  # before_action :user_info_params

  def index
    @user_info = UserInfo.find_by(user_id:current_user.id)
  end

  def show
    # @user_info = UserInfo.find_by(user_id:params[:id])
    @user_info = UserInfo.find(params[:id])
    p @user_info
    p "-------------------------------"
  end

  def new
    @user_info = UserInfo.new
  end

  def create
    user = User.find(current_user.id)
   
    user_info = UserInfo.create!(user:user)
    user_info = user_info.update(user_info_params)
    redirect_to users_info_path
    p user_info_params
    p "-------------------------------"
    p params
  end

  def edit
    @user_info = UserInfo.find_by(user_id:current_user.id)
  end

  def update
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
