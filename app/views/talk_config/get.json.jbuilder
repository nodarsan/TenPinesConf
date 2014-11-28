json.tracks @tracks.map {|eachTrack| eachTrack.name}
json.durations @durations.map {|eachDuration| eachDuration.value}