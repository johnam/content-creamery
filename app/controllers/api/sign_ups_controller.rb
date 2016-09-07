class Api::SignUpsController < ApplicationController

  def create
    @sign_up = SignUp.new(sign_up_params)

    if @sign_up.valid?
      @sign_up.save
      SyncSubscriberJob.perform_later @sign_up

      render status: :created, json: { email: @sign_up.email }
    elsif @sign_up.errors.messages[:email] == ['has already been taken']
      existing_sign_up = SignUp.where(email: @sign_up.email).first
      SyncSubscriberJob.perform_later existing_sign_up

      render status: :ok, json: { email: existing_sign_up.email }
    else
      render status: :bad_request, json: { errors: @sign_up.errors.full_messages }
    end
  end

  def update
    @sign_up = SignUp.where(email: sign_up_params['id']).first

    if @sign_up
      @sign_up.update_attributes sign_up_params.slice(:age, :gender)
    end

    render status: :ok, json: true
  end

  private

  def sign_up_params
    params.require(:sign_up).permit(:email, :id, :age, :gender)
  end

end