class CheckoutController < ApplicationController
  def create
    @total = 0
    @hash = session[:shopping_cart]
    @products ||= []
    @hash.each do |key,value|
        @items = Item.find(key)
        @products << @items
      end
        puts @products


    if @products.nil?
      redirect_to root_path
      nil
    end
    @session = Stripe::Checkout::Session.create(
      # went to stripe API, looked up sessions, figured it all out..
      payment_method_types: ['card'],
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url,
      line_items:
        @products.map do |u|
          @total += u.price
          { 'name' => u.name, 'description' => u.description, 'amount' => (u.price * 100).to_i, 'currency' => 'cad',
            'quantity' => 1 }
        end
    )
    redirect_to @session.url
  end

  def success
    redirect_to root_path
  end

  def cancel

  end

end