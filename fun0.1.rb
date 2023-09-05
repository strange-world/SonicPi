# Set the tempo and time signature
use_bpm 120
time_signature = 4

# Define some drum samples
kick = :bd_haus
snare = :drum_snare_hard
hihat = :drum_cymbal_closed

# Define sample patterns
kick_pattern = [1, 0, 1, 0, 1, 0, 1, 0]
snare_pattern = [0, 0, 1, 0, 0, 1, 0, 0]
hihat_pattern = [1, 1, 1, 1, 1, 1, 1, 1]

# Live loop for drums
live_loop :drums do
    time_signature.times do |i|
        sample kick, amp: 1, on: kick_pattern[i] == 1
        sample snare, amp: 1.2, on: snare_pattern[i] == 1
        sample hihat, amp: 0.5, on: hihat_pattern[i] == 1
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
    