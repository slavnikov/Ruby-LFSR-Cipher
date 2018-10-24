require_relative 'XOR'

def right_shift_hex(hex, offset)
  binary = hex_to_bin(hex)

  '0' * offset + binary[0...-1 * offset]
end
