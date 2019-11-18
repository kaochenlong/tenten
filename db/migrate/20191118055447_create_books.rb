class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.date :publish_date
      t.decimal :list_price
      t.decimal :sell_price
      t.integer :page_num
      t.string :isbn
      t.string :isbn13
      t.text :description
      t.text :about
      t.text :outline
      t.boolean :on_sell

      t.timestamps
    end

    add_index :books, :isbn, unique: true
    add_index :books, :isbn13, unique: true
  end
end
