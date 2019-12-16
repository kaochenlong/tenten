require 'rails_helper'

# 商品可以放到購物車裡，也可以再拿出來。
# 每個 Cart Item 都可以計算它自己的金額（小計）。
# 可以計算整台購物車的總消費金額。

RSpec.describe Cart, type: :model do
  context "基本功能" do
    it "可以把商品丟到到購物車裡，然後購物車裡就有東西了" do
      cart = Cart.new  # PORO
      cart.add_item(1)
      expect(cart.empty?).to be false
    end

    it "加了相同的商品，項目不會增加，商品數量會改變" do
      cart = Cart.new

      3.times { cart.add_item(1) }
      2.times { cart.add_item(2) }

      expect(cart.items.count).to be 2
      expect(cart.items.first.quantity).to be 3
    end
  end
end

