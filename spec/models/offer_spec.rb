# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Offer, type: :model do
  subject { build(:offer) }

  describe 'validations' do
    it { should validate_presence_of(:company) }
    it { should validate_presence_of(:advertiser_name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:starts_at) }
    it { should validate_length_of(:description).is_at_most(500) }
    it do
      should allow_values('http://foo.com', 'http://bar.com/baz').for(:url)
      should_not allow_values('foo', 'buz').for(:url)
    end

    context 'with valid params' do
      it 'return true' do
        expect(subject.valid?).to eq true
      end
    end

    context 'custom validations' do
      context 'with ends_at surpassing starts_end' do
        subject { build(:offer, ends_at: Time.now - 1.day) }

        it 'return false' do
          expect(subject.valid?).to eq false
        end
      end
    end
  end
end
