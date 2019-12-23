class OrdersController < ApplicationController
  before_action :authenticate_user!

  layout 'book'

  def index
    @orders = current_user.orders.order(id: :desc)
  end

  def pay
    @token = gateway.client_token.generate
    @order = current_user.orders.find_by(num: params[:id])
  end

  def paid
    nonce = params[:nonce]
    order = current_user.orders.find_by(num: params[:id])

    result = gateway.transaction.sale(
      amount: order.total_price,
      payment_method_nonce: nonce,
      options: {
        submit_for_settlement: true
      }
    )

    if result.success?
      order.pay!(transaction_id: result.transaction.id)
      redirect_to orders_path, notice: "交易完成!"
    else
      redirect_to orders_path, notice: "交易發生錯誤! #{result.transaction.status}"
    end
  end

  def cancel
    order = current_user.orders.find_by(num: params[:id])

    if order.paid?
      gateway.transaction.void(order.transaction_id)
      result = gateway.transaction.refund(order.transaction_id)

      if result.success?
        order.cancel! if order.may_cancel?
        redirect_to orders_path, notice: "訂單#{order.num}已取消並完成退款"
      else
        redirect_to orders_path, notice: "訂單#{order.num}退款發生錯誤"
      end
    else
      order.cancel! if order.may_cancel?
      redirect_to orders_path, notice: "訂單#{order.num}已取消"
    end
  end

  def create
    @order = current_user.orders.build(order_params)

    current_cart.items.each do |item|
      @order.order_items.build(book: item.product, 
                               quantity: item.quantity, 
                               sell_price: item.product.sell_price)
    end

    if @order.save
      # 1. 清空購物車
      session['cart9527'] = nil
      # 2. 進入付款頁
      redirect_to pay_order_path(@order.num), notice: '訂單已成立！'
    else
      flash[:notice] = @order.errors.full_messages
      redirect_to root_path
      # render 'carts/checkout'
    end
  end

  private
  def order_params
    params.require(:order).permit(:recipient, :tel, :address, :note)
  end

  def gateway
    Braintree::Gateway.new(
      environment: :sandbox,
      merchant_id: ENV['braintree_merchant_id'],
      public_key: ENV['braintree_public_key'],
      private_key: ENV['braintree_private_key']
    )
  end
end

