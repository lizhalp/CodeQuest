# frozen_string_literal: true

class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[new create omniauth]
  rate_limit to: 10, within: 3.minutes, only: :create, with: lambda {
    redirect_to new_session_url, alert: "Try again later."
  }

  def new; end

  def create
    if (user = User.authenticate_by(params.permit(:email_address, :password)))
      start_new_session_for user
      redirect_to after_authentication_url
    else
      redirect_to new_session_path, alert: "Try another email address or password."
    end
  end

  def destroy
    terminate_session
    redirect_to new_session_path
  end

  def omniauth
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.save
      start_new_session_for @user
      redirect_to after_authentication_url
    else
      flash[:danger] = @user.errors.full_messages.join(", ")
      redirect_to new_session_url
    end
  end
end
