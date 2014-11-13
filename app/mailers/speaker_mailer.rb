class SpeakerMailer < ActionMailer::Base
  default from: 'notification@tenpinesconf.com'

  MAIL_SUBJECT = '10PinesConf - Gracias'

  def thank_you_mail(person, talk)
    @person = person
    @talk = talk
    mail(to: @person.mail, subject: MAIL_SUBJECT)
  end
end
