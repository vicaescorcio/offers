# frozen_string_literal: true

# Migration of Offers model
class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :advertiser_name, index: true, null: false
      t.string :url, index: true, null: false, limit: 500
      t.text :description, index: true, null: false
      t.datetime :starts_at, null: false
      t.datetime :ends_at
      t.boolean :premium, default: false
      t.integer :status, default: 0, index: true

      t.timestamps
    end
  end
end
