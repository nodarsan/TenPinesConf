json.tracks @tracks.map do |eachTrack|
  json.name eachTrack.name
  json.id eachTrack.id
end
json.durations @durations.map {|eachDuration| eachDuration.value}