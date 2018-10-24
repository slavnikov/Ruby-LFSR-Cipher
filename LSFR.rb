require_relative 'XOR'

def right_shift_hex(hex, offset)
  binary = hex_to_bin(hex)
  shifted_binary  = '0' * offset + binary[0...-1 * offset]

  bin_to_hex(shifted_binary)
end

def lsfr_step_hex(current_hex, feedback_hex)
  current_binary = hex_to_bin(current_hex)

  if current_binary[-1] == '0'
    right_shift_hex(current_hex, 1)
  else
    hex_xor(right_shift_hex(current_hex, 1), feedback_hex)
  end
end

def next_lsfr_hex_key(current_hex, feedback_hex)
  8.times do
    current_hex = lsfr_step(current_hex, feedback_hex)
  end
  current_hex[-2..-1]
end

def char_to_hex(char)
  char.ord.to_s(16)
end
