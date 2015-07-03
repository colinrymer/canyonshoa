class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:approved] == "false"
      @waiting_approval = true
      @users = User.needing_approval
    else
      @waiting_approval = false
      @users = User.approved
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      render :show
    else
      render :edit
    end
  end

  def approve
    if current_user.admin?
      @user = User.find_by_id(params[:id])
      if @user.update(approved: true)
        UserMailer.welcome_email(@user).deliver
        flash[:success] = "User was approved."
      else
        flash[:error] = "User was unable to be approved."
      end
    else
      flash[:error] = "You are unauthorized to perform that action."
    end
    redirect_to members_path
  end

  private

  def user_params
    params.required(:user).permit(:first_name, :last_name, :address, :email, :password, :password_confirmation)
  end
end
