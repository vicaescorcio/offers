# frozen_string_literal: true

class CreateAdminUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_users do |t|
      t.string :username, null: false, index: true
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
