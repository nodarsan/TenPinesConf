class OrganizerMailer < ActionMailer::Base
  default from: 'notification@tenpinesconf.com'
  default to: 'organizer@tenpinesconf.com'

  NEW_TALK_SUBJECT = 'New Talk proposal'

  def new_talk_mail(speaker, talk)
    @speaker = speaker
    @talk = talk
    mail(subject: NEW_TALK_SUBJECT)
  end
end
