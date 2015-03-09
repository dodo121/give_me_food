class ChargesController < ApplicationController
  def new
  end

  def create
    customer = Stripe::Customer.create(
      email: params[:email],
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: params[:amount],
      description: 'Premium Account',
      currency: 'usd'
    )
    current_user.make_premium(params[:month_number]) if charge[:paid]

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to edit_user_registration_path
  end
end
