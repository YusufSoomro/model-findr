class Api::UserViewsController < ApplicationController
  before_action :require_signed_in

  def create
    @user_view = UserView.new(user_view_params)

    if @user_view.save
      render json: @user_view
    else
      render json: @user_view.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
    def user_view_params
      params.require(:user_view).permit(:user_id)
    end
end
