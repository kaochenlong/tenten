class Book < ApplicationRecord
  # validations
  validates :title, presence: true
  validates :isbn, :isbn13, presence: true, uniqueness: true
  validates :list_price, :sell_price, :page_num, numericality: { greater_than: 0 }

  # relationships
  belongs_to :publisher
  belongs_to :category
  has_one_attached :cover_image
  has_many :comments

  # scopes
  default_scope { with_attached_cover_image }
  scope :available, -> { where(on_sell: true).where('list_price > 0') }
end
