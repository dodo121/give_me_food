class ChargesController < ApplicationController
  def new
  end

  def create
    @amount == 500

    customer = Stripe::Customer.create(
      email: params[:email],
      card: params["StripeToken"]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: params[:amount],
      description: 'Premium Account',
      currency: 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
