class CreateScreenings < ActiveRecord::Migration[5.1]
  def change
    create_table :screenings, id: :uuid do |t|
      t.references :manager, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.datetime :showing_start, default: nil

      t.timestamps
    end

    add_foreign_key :screenings, :users, column: :manager_id
  end
end
