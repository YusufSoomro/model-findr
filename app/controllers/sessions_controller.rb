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
      flash.now[:error] = "Wrong combination of email/password"
      render 'sessions/new'
    end
  end

  def destroy
    logout!
    render json: {}
  end
end
