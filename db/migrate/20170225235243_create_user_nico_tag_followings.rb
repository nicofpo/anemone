class CreateUserNicoTagFollowings < ActiveRecord::Migration[5.0]
  def change
    create_table :user_nico_tag_followings do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.belongs_to :nico_tag, foreign_key: false, null: false

      t.timestamps null: false
    end

    add_index :user_nico_tag_followings, %i(user_id nico_tag_id), unique: true
  end
end
