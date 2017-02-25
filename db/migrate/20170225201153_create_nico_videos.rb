# frozen_string_literal: true
class CreateNicoVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :nico_videos do |t|
      t.string :nid, null: false, charset: 'ascii', collation: 'ascii_bin'
      t.string :title
      t.text :description
      t.string :thumbnail_url
      t.integer :length
      t.datetime :first_retrieve_at
      t.belongs_to :user, foreign_key: false, null: false

      t.timestamps null: false
    end

    add_index :nico_videos, :nid, unique: true
  end
end
