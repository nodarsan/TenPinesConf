class TalkRegister
  def register_new_talk(speakerData, talkData)
    newTalk = create_speaker_and_talk(speakerData, talkData)
    SpeakerMailer.thank_you_mail(newTalk).deliver
    OrganizerMailer.new_talk_mail(newTalk).deliver
    newTalk
  end

  def create_speaker_and_talk(speakerData, talkData)
    newSpeaker = Speaker.new(speakerData)
    newTalk = Talk.new
    newTalk.title = talkData[:title]
    newTalk.description = talkData[:description]
    newTalk.talk_duration = TalkDuration.find_by_value(talkData[:duration])
    newTalk.talk_track = TalkTrack.find_by_name(talkData[:track])
    newTalk.speaker = newSpeaker
    newTalk.save!
    newTalk
  end
end