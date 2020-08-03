class EnableUuidExtension < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'pgcrypto'

    add_column :offers, :uuid, :uuid, default: 'gen_random_uuid()', null: false

    change_table :offers do |t|
      t.remove :id, :client_id
      t.rename :uuid, :id
      t.uuid :client_id
    end
    execute 'ALTER TABLE offers ADD PRIMARY KEY (id);'

    add_column :clients, :uuid, :uuid, default: 'gen_random_uuid()', null: false
    change_table :clients do |t|
      t.remove :id
      t.rename :uuid, :id
    end

    execute 'ALTER TABLE clients ADD PRIMARY KEY (id);'
  end
end
