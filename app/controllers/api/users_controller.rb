class Api::UsersController < ApplicationController

  def index
    if params[:your_city]
      @users = User.joins('LEFT OUTER JOIN user_views ON users.id = user_views.user_id')
       .where("city = ? AND guest = false", current_user.city)
       .order("COUNT(user_views.id) desc")
       .group("users.id")
       .limit(20)
    elsif params[:city]
      @users = User.joins('LEFT OUTER JOIN user_views ON users.id = user_views.user_id')
       .where("city = ? AND guest = false", params[:city])
       .order("COUNT(user_views.id) desc")
       .group("users.id")
       .limit(20)
    else
      @users = User.joins(:user_views)
        .where("guest = false")
        .order("COUNT(user_views.id) desc")
        .group("users.id")
        .limit(20)
    end

    render 'api/users/index.json.jbuilder'
  end

  def show
    if params[:username]
      @user = User.where("username = '#{params[:username]}'").first
    else
      @user = User.find(params[:id])
    end

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

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      render json: @user
    else
      render json: {}, status: :unprocessable_entity
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
