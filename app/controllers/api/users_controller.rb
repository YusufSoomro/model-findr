class Api::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render 'api/users/show.json.jbuilder'
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render json: @user
    else
      render json: "OOOHHH NNEEEWW", status: :unprocessable_entity
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
        :about_me,
        :experience,
        :compensation,
        :avatar_img
      )
    end
end
