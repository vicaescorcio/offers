# frozen_string_literal: true

require 'rails_helper'

describe OffersController do
  let(:json) { JSON.parse(response.body) }

  before do
    request.accept = 'application/json'
  end

  describe 'GET index' do
    context 'success' do
      context 'all offers' do
        before do
          get :index, params: { format: 'html' }
        end

        it { expect(response).to have_http_status(:ok) }
      end

      context 'premium offers' do
        before do
          get :index, params: { premium: true, format: 'html' }
        end

        it { expect(response).to have_http_status(:ok) }
      end

      context 'remote request' do
        before do
          get :index, params: { premium: true }, format: :js
        end

        it { expect(response).to have_http_status(:ok) }
      end
    end
  end
end
