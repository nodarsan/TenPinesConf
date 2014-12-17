class PurchaseMailer < ActionMailer::Base
  default from: 'notification@tenpinesconf.com'
  PURCHASE_SUBJECT = 'Your TenPinesConf Ticket'

  def purchase_mail(attendee)
    @attendee = attendee
    mail(subject: PURCHASE_SUBJECT, to: attendee.mail)
  end
end
