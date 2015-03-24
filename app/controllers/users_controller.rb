class UsersController < ApplicationController
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

  private

  def user_params
    params.required(:user).permit(:first_name, :last_name, :address, :email, :password, :password_confirmation)
  end
end
