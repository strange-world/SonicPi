# Set the tempo and time signature
use_bpm 140
time_signature = 4

# Define the drum samples
kick = :bd_haus
snare = :drum_snare_hard
hihat = :drum_cymbal_closed

# Define additional percussion samples
clap = :elec_mid_snare
tom = :drum_tom_mid_hard

# Define the beat patterns
kick_pattern = [1, 0, 1, 0, 1, 0, 1, 0]
snare_pattern = [0, 0, 1, 0, 0, 1, 0, 0]
hihat_pattern = [1, 1, 1, 1, 1, 1, 1, 1]
clap_pattern = [0, 0, 0, 0, 1, 0, 0, 0]
tom_pattern = [0, 0, 0, 0, 0, 0, 1, 0]

# Live loop for drums
live_loop :drums do
  time_signature.times do |i|
    sample kick, amp: 1, on: kick_pattern[i] == 1
    sample snare, amp: 1.2, on: snare_pattern[i] == 1
    sample hihat, amp: 0.5, on: hihat_pattern[i] == 1
    sample clap, amp: 1.2, on: clap_pattern[i] == 1
    sample tom, amp: 1, on: tom_pattern[i] == 1
    sleep 0.25
  end
end

# Live loop for a bass synth
live_loop :bass do
  use_synth :tb303
  use_synth_defaults release: 0.1, cutoff: 80, amp: 0.6
  play :C2
  sleep 1
end

# Live loop for a lead synth
live_loop :lead do
  use_synth :saw
  use_synth_defaults release: 0.3, cutoff: rrand(70, 130), amp: 0.4
  play scale(:e3, :minor_pentatonic).choose, pan: rrand(-1, 1)
  sleep 0.5
end
