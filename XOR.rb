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
    'a' => '1010',
    'b' => '1011',
    'c' => '1100',
    'd' => '1101',
    'e' => '1110',
    'f' => '1111',
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
    '1010' => 'a',
    '1011' => 'b',
    '1100' => 'c',
    '1101' => 'd',
    '1110' => 'e',
    '1111' => 'f',
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
  bin1 = hex_to_bin(hex1)
  bin2 = hex_to_bin(hex2)
  binary = bin_xor(bin1, bin2)

  bin_to_hex(binary)
end
