class CreateUserSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :user_sessions do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.string :token, null: false, charset: 'ascii', collation: 'ascii_bin'
      t.string :user_agent
      t.string :remote_addr

      t.timestamps null: false
    end

    add_index :user_sessions, :token, unique: true
  end
end
