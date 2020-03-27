# frozen_string_literal: true

FactoryBot.define do
  factory :offer do
    advertiser_name { 'Company Doe' }
    url { 'https://companydoe.com' }
    description do
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.
      Aenean at egestas ipsum, eu suscipit leo.
      Sed sit amet elit et felis tincidunt volutpat.
      Sed dapibus pharetra sagittis.
      Vivamus tellus eros, cursus sed suscipit sit amet, vestibulum vitae felis.
      Aenean interdum, diam eu vestibulum tempor, est purus efficitur purus,
      non varius metus leo eget eros.'
    end
    starts_at { Time.now }
    ends_at { Time.now + 30.days }
    premium { true }
  end
end
