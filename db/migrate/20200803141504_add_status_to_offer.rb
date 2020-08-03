class AddStatusToOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :status, :string, null: false, default: 'created'
  end
end
