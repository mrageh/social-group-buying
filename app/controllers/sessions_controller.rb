class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    if user = Session.new(params[:session]).user
      session[:user_id] = user.id
      redirect_to root_path,
        notice: I18n.t('flashes.successfully_signed_in')
    else
      redirect_to sign_in_path,
        notice: I18n.t('flashes.invalid_sign_in_details')
    end
  end

  def destroy
    session.destroy
    redirect_to root_path,
      notice: I18n.t('flashes.successfully_signed_out')
  end
end
