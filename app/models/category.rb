class Category < ApplicationRecord
  # relationships
  has_many :books

  # validations
  validates :title, presence: true
end

