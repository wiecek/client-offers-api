class MergeClientsWithUsers < ActiveRecord::Migration[6.0]
  def change
    drop_table :clients
    add_column :users, :type, :string, null: false

    add_foreign_key :offers, :users, column: 'client_id'
  end
end
