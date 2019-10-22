class ChangeNotNullScreeningBody < ActiveRecord::Migration[6.0]
  def change
    change_column_null :screenings, :body, true
  end
end
