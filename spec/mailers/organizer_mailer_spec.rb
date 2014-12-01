require 'rails_helper'

describe OrganizerMailer do
  before(:each) do
    @talk = create(:interesting_talk)
    ActionMailer::Base.deliveries = []
    @mail = OrganizerMailer.new_talk_mail(@talk)
  end

  it 'should be sent' do
    @mail.deliver
    expect(ActionMailer::Base.deliveries.empty?).to be_falsey
  end

  it 'should ' do
    expect(@mail.to).to eq(['organizer@tenpinesconf.com'])
    expect(@mail.from).to eq(['notification@tenpinesconf.com'])
    expect(@mail.subject).to eq('New Talk Proposal')
  end
end
