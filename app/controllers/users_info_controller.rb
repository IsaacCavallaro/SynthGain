class UsersInfoController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_current_user_info, only: [:index, :edit, :update]

  def index
    return if @user_info.present?

    redirect_to users_info_new_path(current_user.id), alert: "Complete your seller profile to list gear."
  end

  def show
    @user_info = UserInfo.find_by!(user_id: params[:id])
  end

  def new
    if current_user.user_info.present?
      redirect_to users_info_path, notice: "Your profile is already set up."
    else
      @user_info = current_user.build_user_info
    end
  end

  def create
    @user_info = current_user.user_info || current_user.build_user_info

    if @user_info.update(user_info_params)
      redirect_to users_info_path, notice: "Profile created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user_info.update(user_info_params)
      redirect_to users_info_path, notice: "Profile updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_info_params
    params.require(:user_info).permit(:country, :city, :street, :postcode, :picture)
  end

  def set_current_user_info
    @user_info = current_user.user_info
  end
end
