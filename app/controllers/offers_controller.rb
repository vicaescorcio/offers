# frozen_string_literal: true

# Offers controller
class OffersController < ApplicationController
  before_action :set_offers, only: :index

  def index
    respond_to do |format|
      format.js
      format.html
    end
  end

  private

  def set_offers
    if params[:premium]
      @offers = Offer.where(premium: true)
    else
      @offers = Offer.all
    end
  end
end
