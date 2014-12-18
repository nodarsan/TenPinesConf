class TalkRegister
  def register_new_talk(speaker, talkData)
    newTalk = create_talk_for_speaker(speaker, talkData)
    SpeakerMailer.thank_you_mail(newTalk).deliver
    OrganizerMailer.new_talk_mail(newTalk).deliver
    newTalk
  end

  def create_talk_for_speaker(speaker, talkData)
    newTalk = Talk.new
    newTalk.title = talkData[:title]
    newTalk.description = talkData[:description]
    newTalk.talk_duration = TalkDuration.find_by_value(talkData[:duration])
    newTalk.talk_track = TalkTrack.find_by_name(talkData[:track])
    newTalk.speaker = speaker
    newTalk.save!
    newTalk
  end
end