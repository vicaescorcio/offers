# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Offer, type: :model do
  subject { build(:offer) }

  describe 'validations' do
    it { should validate_presence_of(:advertiser_name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:starts_at) }

    context 'with valid params' do
      it 'return true' do
        expect(subject.valid?).to eq true
      end
    end

    context 'with invalid params' do
      subject { build(:offer, name: nil) }

      it 'return false' do
        expect(subject.valid?).to eq false
      end
    end
  end
end
