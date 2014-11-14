class TalkRegister
  def register_new_talk(speakerData, talkData)
    speaker = Speaker.new(speakerData)
    speaker.save!
    talk = Talk.new
    talk.title = talkData[:title]
    talk.description = talkData[:description]
    talk.speaker = speaker
    talk.talk_duration = TalkDuration.find_by_value(talkData[:duration])
    talk.talk_track = TalkTrack.find(talkData[:track])
    talk.save!
    SpeakerMailer.thank_you_mail(speaker, talk).deliver
    OrganizerMailer.new_talk_mail(speaker, talk).deliver
  end
end