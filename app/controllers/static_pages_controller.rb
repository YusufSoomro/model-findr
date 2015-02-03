class StaticPagesController < ApplicationController
  before_action :require_signed_in!

  def root
    render 'static_pages/root'
  end
end
