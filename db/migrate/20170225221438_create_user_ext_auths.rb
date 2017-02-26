class CreateUserExtAuths < ActiveRecord::Migration[5.0]
  def change
    create_table :user_ext_auths do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.string :provider, null: false, charset: 'ascii', collation: 'ascii_bin'
      t.string :uid, null: false, charset: 'ascii', collation: 'ascii_bin'

      t.timestamps null: false
    end

    add_index :user_ext_auths, %i(provider uid), unique: true
  end
end
