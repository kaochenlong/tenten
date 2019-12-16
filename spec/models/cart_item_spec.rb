require 'rails_helper'

RSpec.describe CartItem, type: :model do

  let(:cart) { Cart.new }

  it "每個 Cart Item 都可以計算它自己的金額（小計）" do
    # AAA
    # Arrange
    book1 = create(:book, sell_price: 50)
    book2 = create(:book, sell_price: 100)

    # Act
    3.times { cart.add_item(book1.id) }
    2.times { cart.add_item(book2.id) }

    # Assert
    expect(cart.items.first.total_price).to eq 150
    expect(cart.items.last.total_price).to eq 200
  end
end
