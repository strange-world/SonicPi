use_bpm 65

# Define drum samples
kick = :bd_mehackit
snare = :elec_twip

# Define bass samples
bass_samples = [:bd_808, :bd_haus]

# Define synth samples
synth_samples = [:ambi_dark_woosh, :ambi_glass_rub]

# Define effects samples
effects_samples = [:elec_sad, :elec_bong, :elec_echo]

live_loop :drums do
  sample kick
  sleep 1
  sample snare
  sleep 1
end

live_loop :sample do
  sync :drums
  sample choose([:ambi_lunar_land, :ambi_dark_woosh]), beat_stretch: 8
  sleep 8
end

live_loop :bass do
  sync :drums
  use_synth :prophet
  sample bass_samples.choose, amp: 3
  play chord(:c2, :minor).choose, sustain: 6, amp: 0.7, cutoff: 90, detune: 12
  sleep 8
end

live_loop :synth do
  sync :drums
  use_synth :dark_ambience
  sample synth_samples.choose, amp: 3
  play chord(:c2, :minor).choose, sustain: 6, amp: 0.7, cutoff: 100, detune: 15
  sleep 8
end

live_loop :effects do
  sync :drums
  sample effects_samples.choose, amp: 1.5, rate: 0.8
  sleep 4
end
