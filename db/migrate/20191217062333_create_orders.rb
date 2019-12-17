class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :recipient
      t.string :tel
      t.string :address
      t.text :note
      t.string :state
      t.string :num

      t.timestamps
    end
  end
end
