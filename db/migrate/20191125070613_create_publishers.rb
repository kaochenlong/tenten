class CreatePublishers < ActiveRecord::Migration[6.0]
  def change
    create_table :publishers do |t|
      t.string :name
      t.string :tel
      t.string :address
      t.text :note
      t.boolean :online, default: true

      t.timestamps
    end
  end
end
