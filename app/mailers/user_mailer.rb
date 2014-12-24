class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def newsletter(user)
    @user = user
    mail to: @user.email, subject: 'Give me food Newsletter'
  end

end
