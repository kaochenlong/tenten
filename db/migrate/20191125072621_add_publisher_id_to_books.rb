class AddPublisherIdToBooks < ActiveRecord::Migration[6.0]
  def change
    # add_column :books, :publisher_id, :integer
    # add_index :books, :publisher_id

    add_reference :books, :publisher
  end
end

