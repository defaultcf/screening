class CreateUserProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_profiles do |t|
      t.belongs_to :user, foreign_key: true
      t.string :username, null: false
      t.string :nickname, null: false
      t.string :avatar
      t.text   :bio

      t.timestamps
    end

    add_index :user_profiles, :username, unique: true
  end
end
