require 'rails_helper'

describe 'Admin password mailer behaviour' do

  before do
    ActionMailer::Base.deliveries = []
    @mail = AdminMailer.deliver_new_password_mail('una password', 'mmelendi@10pines.com')
  end

  it 'should be sent' do
    @mail.deliver
    expect(ActionMailer::Base.deliveries.empty?).to be_falsey
  end

  it 'should send an email to speaker email address' do
    expect(@mail.to).to eq(['mmelendi@10pines.com'])
    expect(@mail.from).to eq(['password-admin@tenpinesconf.com'])
    expect(@mail.subject).to eq('Your Password')
    expect(@mail.body.raw_source).to eq(" This is your new password: una password , be careful and don't forget it anymore!
                     Because it make me feel angry >:( ")
  end
end