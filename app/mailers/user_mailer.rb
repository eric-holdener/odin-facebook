class UserMailer < ApplicationMailer
  default from: 'notifications@ericholdener.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to my Facebook Project!')
  end
end
