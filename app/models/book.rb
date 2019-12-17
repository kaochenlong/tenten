class Book < ApplicationRecord
  acts_as_paranoid

  # validations
  validates :title, presence: true
  validates :isbn, :isbn13, presence: true, uniqueness: true
  validates :list_price, :sell_price, :page_num, numericality: { greater_than: 0 }

  # relationships
  belongs_to :publisher
  belongs_to :category
  has_one_attached :cover_image
  has_many :comments
  has_many :favorites
  has_many :users, through: :favorites

  # scopes
  default_scope { with_attached_cover_image }
  scope :available, -> { where(on_sell: true).where('list_price > 0') }

  def favorited_by?(u)
    favorites.exists?(user: u)
  end
end

