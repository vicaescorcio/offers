# frozen_string_literal: true

# Model AdminUser
class AdminUser < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true, format: { without: /\s/ }
end
