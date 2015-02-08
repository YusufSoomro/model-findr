require 'byebug'

class Api::ImagesController < ApplicationController
  before_action :require_signed_in!

  def create
    @image = Image.new(image_params)

    if @image.save
      render json: @image
    else
      render @image.errors.full_messages, status: :unprocessable_entity
    end
  end

  def index
    @current_user = current_user

    if params[:your_city]
      ## Why the fuck?....
      @images = Image.joins('LEFT OUTER JOIN image_likes ON images.id = image_likes.image_id')
       .where("user_city = ?", current_user.city)
       .order("COUNT(image_likes.id)")
       .group("images.id")
       .limit(20)
    else
      @images = Image.joins(:image_likes)
        .order('COUNT(image_likes.id)')
        .group('images.id')
        .limit(20)
    end

    render 'api/images/index.json.jbuilder'
  end

  def show
    @image = Image.find(params[:id])

    if @image
      render 'api/images/show.json.jbuilder'
    else
      render json: "Image not found", status: :unprocessable_entity
    end
  end

  private
    def image_params
      params.require(:image).permit(:user_id, :img_url, :caption, :user_city)
    end
end
