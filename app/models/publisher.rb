class Publisher < ApplicationRecord
  # validations
  validates :name, presence: true

  # scopes
  scope :available, -> { where(online: true) }

  # relationships
  has_many :books
end

