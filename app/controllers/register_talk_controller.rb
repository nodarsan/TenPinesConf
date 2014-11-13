class RegisterTalkController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def new
    person = Person.new(person_params)
    person.save
    talk = Talk.new
    talk.title = params[:talk][:title]
    talk.description = params[:talk][:description]
    talk.person = person
    duration = TalkDuration.find_by_value(params[:talk][:duration])
    talk.talk_duration = duration
    track = TalkTrack.find(params[:talk][:track])
    talk.talk_track = track
    talk.save

    SpeakerMailer.thank_you_mail(person, talk).deliver
    OrganizerMailer.new_talk_mail(person, talk).deliver
    render plain: ''
  end

  private
  def person_params
    params.require(:person).permit(:name, :mail, :phone, :country, :bio)
  end
end