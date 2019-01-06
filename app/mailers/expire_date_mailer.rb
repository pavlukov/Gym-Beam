class ExpireDateMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def expire_notification
    @user = params[:user]
    @ticket = params[:ticket]
    mail(to: @user.email, subject: 'Gym Beam expire notification')
  end
end
