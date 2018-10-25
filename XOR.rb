def hex_to_bin(hex)
  hex_bin = {
    '0' => '0000',
    '1' => '0001',
    '2' => '0010',
    '3' => '0011',
    '4' => '0100',
    '5' => '0101',
    '6' => '0110',
    '7' => '0111',
    '8' => '1000',
    '9' => '1001',
    'A' => '1010',
    'B' => '1011',
    'C' => '1100',
    'D' => '1101',
    'E' => '1110',
    'F' => '1111',
  }
  binary_output = '';

  hex.each_char do |char|
    binary_output += hex_bin[char]
  end
  binary_output
end

def bin_to_hex(bin_byte)
  bin_hex = {
    '0000' => '0',
    '0001' => '1',
    '0010' => '2',
    '0011' => '3',
    '0100' => '4',
    '0101' => '5',
    '0110' => '6',
    '0111' => '7',
    '1000' => '8',
    '1001' => '9',
    '1010' => 'A',
    '1011' => 'B',
    '1100' => 'C',
    '1101' => 'D',
    '1110' => 'E',
    '1111' => 'F',
  }
  hexidecimal_output = ''

  (bin_byte.length / 4).times do |idx|
    hexidecimal_output += bin_hex[bin_byte[idx * 4 ... (idx + 1) * 4]]
  end
  hexidecimal_output
end

def bin_xor(bin1, bin2)
  xor_bin = ''

  bin1.each_char.with_index do |chr, idx|
    if chr == bin2[idx]
      xor_bin += '0'
    else
      xor_bin += '1'
    end
  end
  xor_bin
end

def hex_xor(hex1, hex2)
  bin1 = hex_to_bin(hex1.upcase)
  bin2 = hex_to_bin(hex2.upcase)
  binary = bin_xor(bin1, bin2)

  bin_to_hex(binary)
end
