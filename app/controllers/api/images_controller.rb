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
    if params[:your_city]
      @images = Image.order(id: :desc)
        .where("user_city = ?", current_user.city)
        .limit(5)
    else
      @images = Image.order(id: :desc).limit(5)
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
