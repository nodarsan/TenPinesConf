class TalkRegister
  def register_new_talk(speaker, talk_data)
    newTalk = create_talk_for_speaker(speaker, talk_data)
    SpeakerMailer.thank_you_mail(newTalk).deliver
    OrganizerMailer.new_talk_mail(newTalk).deliver
    newTalk
  end

  def create_talk_for_speaker(speaker, talk_data)
    new_talk = Talk.new
    new_talk.title = talk_data[:title]
    new_talk.description = talk_data[:description]
    new_talk.talk_duration = TalkDuration.find_by_value(talk_data[:duration])
    new_talk.talk_track = TalkTrack.find_by_name(talk_data[:track])
    new_talk.speaker = speaker
    new_talk.save!
    new_talk
  end

  def edit_talk(speaker, talk_id, talk_data)
    talk_to_modify = Talk.find(talk_id)
    if speaker.eql?(talk_to_modify.speaker)
      talk_to_modify.talk_track = TalkTrack.find_by_name(talk_data[:track])
      talk_to_modify.talk_duration = TalkDuration.find_by_value(talk_data[:duration])
      talk_to_modify.title = talk_data[:title]
      talk_to_modify.description = talk_data[:description]
      talk_to_modify.save!
    else
      raise Exception, 'Speaker cannot modify a talk that does not belong to him'
    end
  end
end