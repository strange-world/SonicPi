# Rap-Inspired Beat in Sonic Pi

use_bpm 140

# Define some drum samples
kick = :drum_bass_hard
snare = :drum_snare_hard
hihat = :drum_cymbal_pedal

# Define a bassline
bassline_notes = [:C2, :E2, :G2, :A2].ring

# Define a melody
melody_notes = [:C4, :D4, :E4, :D4, :C4, :D4, :E4, :D4].ring

# Define a function for the main beat
define :main_beat do
  4.times do
    sample kick
    sleep 0.5
    sample snare
    sleep 0.5
    sample kick
    sleep 0.25
    sample hihat
    sleep 0.25
    sample kick
    sleep 0.5
    sample snare
    sleep 0.5
    sample kick
    sleep 0.25
    sample hihat
    sleep 0.25
  end
end

# Play the main beat
live_loop :beat do
  main_beat
end

# Play the bassline
live_loop :bass do
  use_synth :fm
  play bassline_notes.tick, release: 0.2
  sleep 0.5
end

# Play the melody
live_loop :melody do
  use_synth :piano
  play melody_notes.tick, release: 0.2
  sleep 0.25
end
