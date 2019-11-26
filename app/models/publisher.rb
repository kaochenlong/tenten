class Publisher < ApplicationRecord
  scope :available, -> { where(online: true) }

  has_many :books
end

