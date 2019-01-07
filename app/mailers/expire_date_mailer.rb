class ExpireDateMailer < ApplicationMailer
  default from: "Sergey <sergeybmzh@gmail.com>",
          return_path: 'sergeybmzh@gmail.com',
          sender: 'sergeybmzh@gmail.com'

  def expire_notification
    @user = params[:user]
    @ticket = params[:ticket]
    mail(to: @user.email, subject: 'Gym Beam expire notification')
  end
end
