# app/controllers/orders_controller.rb
class OrdersController < ApplicationController
	before_action :authenticate_user!, except: [:show, :index]
	
	def new
		@block = Block.find(params[:block_id])
		@order = @block.orders.new
	end

	def show
		@order = Order.find(params[:id])
		@price = @order.block.precio.to_f / 100
	end


def create

  @block = Block.find(params[:block_id])
  @order = @block.orders.new(order_params)

  if @order.save

    Stripe.api_key = Rails.application.secrets.stripe_secret_key # set the secret key to identify with stripe.

    Stripe::Charge.create(
      :description => @block.experience.nombre,
      :amount => (@block.precio.round*100)*@order.many,
      :currency => "mxn",
      :card => @order.stripe_token # obtained with Stripe.js
    )
    flash[:success] = "Thanks for purchasing #{@block.experience.nombre}"
    redirect_to block_order_path(@block, @order)
  else

    flash[:error] = "Oops, something went wrong"
    render :new
  end
rescue Stripe::CardError => e
  body = e.json_body
  err  = body[:error]
  flash[:error] = err[:message]
  render :new
end


	private
	def order_params
		params.require(:order).permit(:stripe_token, :block_id, :many)
	end
end


# The syntax above will only find and permit the "stripe_token" attribute if it's nested inside "order".

# params = {
#   "utf8" => "✓",
#   "authenticity_token" => "sSlwx4lcH8pQYHrT9C5RR50sgbsazaCw16SegVsoiaA=",
#   "order" => {
#     "stripe_token"=>"tok_14pfah2uVktQRyY5UIs2cIhP"
#   },
#   "action" => "create",
#   "controller" => "orders",
#   "block_id" => "1"
# }

# To achieve that we appended "<input name="order[stripe_token]" />" to our form using jQuery.