json.array! @talks do |eachTalk|
  json.id eachTalk.id
  json.title eachTalk.title
  json.description eachTalk.description
  json.track eachTalk.talk_track.name
  json.duration eachTalk.talk_duration.value
  json.speaker do
    json.name eachTalk.speaker.name
    json.bio eachTalk.speaker.bio
  end
end