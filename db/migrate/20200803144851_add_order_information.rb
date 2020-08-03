class AddOrderInformation < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :width, :integer, null: false
    add_column :offers, :height, :integer, null: false
    add_column :offers, :length, :integer, null: false

    add_index :offers, :quantity
    add_index :offers, :width
    add_index :offers, :height
    add_index :offers, :length
  end
end
