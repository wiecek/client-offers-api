class AddOrderInformation < ActiveRecord::Migration[6.0]
  def change
    add_column :offers
  end
end
