# frozen_string_literal: true
class CreateNicoUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :nico_users do |t|
      t.string :nid, null: false, charset: 'ascii', collation: 'ascii_bin'
      t.string :nickname
      t.string :icon_url

      t.timestamps null: false
    end

    add_index :nico_users, :nid, unique: true
  end
end
