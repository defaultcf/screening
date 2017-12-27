class CreateRelations < ActiveRecord::Migration[5.1]
  def change
    create_table :relations do |t|
      t.references :follower
      t.references :followed

      t.timestamps
    end

    add_foreign_key :relations, :users, column: :follower_id
    add_foreign_key :relations, :users, column: :followed_id
  end
end
