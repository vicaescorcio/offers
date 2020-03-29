# frozen_string_literal: true

# Offers controller
class OffersController < ApplicationController
  before_action :set_offers, only: :index
  protect_from_forgery except: :index

  def index
    respond_to do |format|
      format.js
      format.html
    end
  end

  private

  def set_offers
    if params[:premium]
      offers = Offer.enabled.where(premium: true)
    else
      offers = Offer.enabled
    end

    @offers = offers.page(params[:page])
  end
end
