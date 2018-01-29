class CreateJoinScreenings < ActiveRecord::Migration[5.1]
  def change
    create_table :join_screenings do |t|
      t.references :screening, type: :uuid, null: false
      t.references :user, null: false
      t.string :message

      t.timestamps
    end

    add_index :join_screenings, [:screening_id, :user_id]
  end
end
