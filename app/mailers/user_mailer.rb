class UserMailer < ActionMailer::Base
  default from: "webadmin@canyonshoa.com"

  def welcome_email(user)
    @user = user
    @url = "https://www.canyonshoa.com/signin"
    mail(to: @user.email, subject: "You've been approved to join the Canyons HOA site.")
  end
end
