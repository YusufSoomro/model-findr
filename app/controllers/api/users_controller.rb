class Api::UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to root_url
    else
      render json: @user.errors.full_messages
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to root_url
    else
      render json: @user.errors.full_messages
    end
  end

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
      :compensation
      )
    end
end
