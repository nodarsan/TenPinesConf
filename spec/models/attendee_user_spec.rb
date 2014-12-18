require 'rails_helper'

describe AttendeeUser do

  before do
    @santi = create(:santi_attendee_user)
  end

  it 'should be valid' do
    expect(@santi.valid?).to be_truthy
  end

  it 'should be able to authorize  with correct data after being created' do
    authenticated_user = AttendeeUser.find_by_email('snodar@10pines.com')
    expect(authenticated_user).to eq(@santi)
    expect(authenticated_user.valid_password?('unaPassword')).to be_truthy
  end

  it 'should not be able to authorize with incorrect mail' do
    expect{AttendeeUser.find_by_email!('un_email_invalido@10pines.com')}.to raise_error
  end

  it 'should not be able to authorize with incorrect password' do
    authenticated_user = AttendeeUser.find_by_email('snodar@10pines.com')
    expect(authenticated_user).to eq(@santi)
    expect(authenticated_user.valid_password?('123')).to be_falsey
  end

end
