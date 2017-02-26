class CreateUserNicoUserFollowings < ActiveRecord::Migration[5.0]
  def change
    create_table :user_nico_user_followings do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :nico_user, foreign_key: false

      t.timestamps null: false
    end

    add_index :user_nico_user_followings, %i(user_id nico_user_id), unique: true
  end
end
