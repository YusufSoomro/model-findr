class Api::ImageLikesController < ApplicationController
  def create
    @image_like = ImageLike.new(image_like_params)

    if @image_like.save
      render json: @image_like
    else
      render json: @image_like.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
    def image_like_params
      params.require(:image_like).permit(:image_id, :liker_id)
    end
end
