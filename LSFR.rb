require_relative 'XOR'
require 'byebug'

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

def char_to_hex(char)
  char.ord.to_s(16).upcase
end

def hex_to_char(hex)
  hex.to_i(16).chr
end

def crypt(data, initial_value)
  feedback_hex = '87654321'
  output_string = ''
  encrypting = data.split('\x').length == 1
  data = encrypting ? data.split('') : data.split('\x')[1..-1]

  data.each do |ele|
    8.times do
      initial_value = lsfr_step_hex(initial_value, feedback_hex)
    end

    ele_hex = encrypting ? char_to_hex(ele) : ele
    key = next_lsfr_hex_key(initial_value)

    if encrypting
      output_string += ('\x' + hex_xor(ele_hex, key))
    else
      output_string += hex_to_char(hex_xor(ele_hex, key))
    end
  end
  output_string
end
