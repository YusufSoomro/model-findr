class Api::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render 'api/users/show.json.jbuilder'
  end

  def update

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
        :about_me,
        :experience,
        :compensation,
        :avatar_img
      )
    end
end
