class AddCompanyToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :company, :string, index: true, null: false
  end
end
