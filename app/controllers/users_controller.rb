class UsersController < ApplicationController
  def new
    @user = User.new
    render 'users/new'
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to root_url
    else
      render 'users/new'
    end
  end

  private
    def user_params
      params.require(:user).permit(
        :email,
        :username,
        :password,
        :skill_type,
        :gender,
        :city,
        :avatar_img
      )
    end
end
