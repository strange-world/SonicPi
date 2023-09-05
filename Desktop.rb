use_bpm 65

live_loop :drums do
  sample :drum_heavy_kick
  sleep 1
  sample :sn_dolf
  sleep 1
end

live_loop :sample do
  sync :drums
  sample :loop_compus, beat_stretch: 8
  #sample :loop_amen_full, beat_stretch: 8
  sleep 8
end

live_loop :bass do
  sync :drums
  use_synth :chipbass
  sample :bd_sone, amp: 3
  play chord( :c2, :minor).choose, sustain: 10, amp: 0.7
  sleep 8
end

live_loop :synth do
  sync :drums
  use_synth :blade
  play chord( :c2, :minor).choose, sustain: 10, amp: 0.7
  sleep 8
end

live_loop :effects do
  sync :drums
  sample choose ([:elec_blip2, :elec_twip, :elec_beep, :elec_ping])
  sleep 2
  live_loop
end
#add randomization to the effects loop
#add a new loop with a different sample
#add a new loop with a different synth
#add a new loop with a different bass

