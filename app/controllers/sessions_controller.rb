class SessionsController < ApplicationController
  def new
    render 'sessions/new'
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if @user
      login!(@user)
      redirect_to root_url
    else
      render json: "Couldn't find user with those credentials"
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end
