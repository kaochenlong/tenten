class AddBelongsToBook < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :category, foreign_key: true
  end
end
