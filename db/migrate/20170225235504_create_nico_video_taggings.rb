class CreateNicoVideoTaggings < ActiveRecord::Migration[5.0]
  def change
    create_table :nico_video_taggings do |t|
      t.belongs_to :video, foreign_key: false, null: false
      t.belongs_to :tag, foreign_key: false, null: false

      t.timestamps null: false
    end

    add_index :nico_video_taggings, %i(video_id tag_id), unique: true
  end
end
