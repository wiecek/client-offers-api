class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.references :client, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
