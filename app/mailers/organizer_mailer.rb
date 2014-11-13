class OrganizerMailer < ActionMailer::Base
  default from: 'notification@tenpinesconf.com'
  default to: 'organizer@tenpinesconf.com'

  def new_talk_mail(person, talk)
    @person = person
    @talk = talk
    mail(subject: 'New Talk proposal')
  end
end
