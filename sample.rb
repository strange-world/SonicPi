# Welcome to Sonic Pi

use_bpm 120

# Define drum samples
kick = :bd_haus
snare = :drum_snare_hard

# Define chord progression
chord_progression = [chord(:c4, :minor), chord(:f4, :major), chord(:g4, :major), chord(:a4, :minor)]

# Define the main drum loop
live_loop :drums do
  16.times do
    sample kick
    sleep 0.5
    sample snare
    sleep 0.5
  end
end

# Define the bass line
live_loop :bass do
  use_synth :tb303
  notes = (ring :C2, :F2, :G2, :A2)
  durations = (ring 1, 1, 1, 1)
  with_fx :distortion, distort: 0.7 do
    play_pattern_timed notes, durations, release: 0.1, cutoff: rrand(70, 130)
  end
end

# Define the chord progression
live_loop :chords do
  use_synth :piano
  4.times do
    progression = chord_progression.tick
    play progression, release: 2
    sleep 2
  end
end

# Define the melody
live_loop :melody do
  use_synth :blade
  melody_notes = (ring :C5, :E5, :D5, :G5)
  durations = (ring 0.5, 0.5, 0.5, 0.5)
  with_fx :reverb, room: 0.8 do
    with_fx :echo, phase: 0.4 do
      play_pattern_timed melody_notes, durations, cutoff: rrand(70, 130)
    end
  end
end

# Create a transition
define :transition do
  with_fx :reverb, room: 0.8 do
    sample :drum_cymbal_open
    sleep 0.5
    sample :drum_snare_soft
    sleep 0.5
  end
end

# Create a refrain
define :refrain do
  with_fx :reverb, room: 0.8 do
    use_synth :piano
    play_chord chord_progression.choose, release: 2
    sleep 2
  end
end

# Define the transition and refrain sections
in_thread do
  sync :drums
  transition
  sleep 8
  refrain
  sleep 8
  transition
  sleep 8
  refrain
end
