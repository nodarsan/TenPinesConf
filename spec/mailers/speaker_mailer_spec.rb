require 'rails_helper'

describe SpeakerMailer do
  
  before(:each) do
    @talk = create(:interesting_talk)
    ActionMailer::Base.deliveries = []
    @mail = SpeakerMailer.thank_you_mail(@talk)
  end

  it 'should be sent' do
    @mail.deliver
    expect(ActionMailer::Base.deliveries.empty?).to be_falsey
  end

  it 'should send an email to speaker email address' do
    expect(@mail.to).to eq([@talk.speaker.mail])
    expect(@mail.from).to eq(['notification@tenpinesconf.com'])
    expect(@mail.subject).to eq('10PinesConf - Gracias')
  end
end
