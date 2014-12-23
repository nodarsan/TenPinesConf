class AdminMailer < ActionMailer::Base
  default from: 'password-admin@tenpinesconf.com'

  NEW_PASSWORD_SUBJECT = 'Your Password'

  def new_password_mail(password, to_email)
    body_message = " This is your new password: #{password} , be careful and don't forget it anymore!
                     Because it make me feel angry >:( "
    mail(to:to_email ,subject: NEW_PASSWORD_SUBJECT, body: body_message)
  end

  def deliver_new_password_mail(password, to_email)
    self.new_password_mail(password, to_email).deliver
  end
end