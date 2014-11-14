class SpeakerMailer < ActionMailer::Base
  default from: 'notification@tenpinesconf.com'

  THANK_YOU_SUBJECT = '10PinesConf - Gracias'

  def thank_you_mail(speaker, talk)
    @speaker = speaker
    @talk = talk
    mail(to: @speaker.mail, subject: THANK_YOU_SUBJECT)
  end
end
