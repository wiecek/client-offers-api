class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email, null: false
      t.string :encrypted_password, null: false
      t.string :authentication_token, null: false

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end
