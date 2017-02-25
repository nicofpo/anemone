# frozen_string_literal: true
class CreateNicoTags < ActiveRecord::Migration[5.0]
  def change
    create_table :nico_tags do |t|
      t.string :name, charset: 'utf8mb4', collation: 'utf8mb4_bin'

      t.timestamps null: false
    end

    add_index :nico_tags, :name, unique: true
  end
end
