class OrganizerMailer < ActionMailer::Base
  default from: 'notification@tenpinesconf.com'
  default to: 'organizer@tenpinesconf.com'

  NEW_TALK_SUBJECT = 'New Talk Proposal'

  def new_talk_mail(talk)
    @speaker = talk.speaker
    @talk = talk
    mail(subject: NEW_TALK_SUBJECT)
  end
end
