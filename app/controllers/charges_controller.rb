class ChargesController < ApplicationController
  def new
  end

  def create
    customer = Stripe::Customer.create(
      email: 'example@stripe.com',
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: 500,
      description: 'Premium Account',
      currency: 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to edit_user_registration_path
  end
end
