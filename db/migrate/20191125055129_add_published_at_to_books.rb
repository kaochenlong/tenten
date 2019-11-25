class AddPublishedAtToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :published_at, :date
  end
end
