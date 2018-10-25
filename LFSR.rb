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

def next_lsfr_hex_key(current_hex)
  current_hex[-2..-1]
end

def hex_to_char(hex)
  hex.to_i(16).chr
end

def byte_to_hex(byte)
  hex = byte.unpack('C2').first.to_s(16).upcase
  hex.length == 1 ? '0' + hex : hex
end

def crypt(data, initial_value)
  feedback_hex = '87654321'
  initial_value = initial_value.to_s(16).upcase
  output_string = ''

  data.each_char do |char|
    8.times do
      initial_value = lsfr_step_hex(initial_value, feedback_hex)
    end

    char_hex = byte_to_hex(char)
    key = next_lsfr_hex_key(initial_value)

    output_string += hex_to_char(hex_xor(char_hex, key))
  end
  output_string
end
