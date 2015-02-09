class Api::UsersController < ApplicationController

  def index
    if params[:your_city]
      @users = User.joins('LEFT OUTER JOIN user_views ON users.id = user_views.user_id')
       .where("city = ?", current_user.city)
       .order("COUNT(user_views.id)")
       .group("users.id")
       .limit(20)
    else
      @users = User.joins(:user_views)
        .order("COUNT(user_views.id)")
        .group("users.id")
        .limit(20)
    end

    render 'api/users/index.json.jbuilder'
  end

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
