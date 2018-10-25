# Ruby LFSR Cipher

The exclusive-or (XOR) operation can be used to encrypt a string by converting each character to binary and performing the XOR operation between the resulting binary and the binary of some key.

A more advanced take on the XOR ciphering method is one that employs Linear Feedback Shift Register (LFSR) to change the key. Not only does the key undergo a pre-determined number of register shifts before serving as the key, but it is also conditionally XORed against a feedback value after every shift. After a key is generated, a single character of the message to be encoded is XORed against the last byte (last 8 bits, or in terms of this implementation the last 8 bit hexadecimal) of they key. The key is then once again shifted and XORed against the feedback value before the next character is encoded. This results in a level of randomness in the key, and thus the output that makes the encryption harder to crack without making the encryption method too much more expensive. This implementation shifts the key 8 times and XORs the key against the feedback value if the last bit of the key is 1.

The two included files are intended as a breakdown of the XOR LFSR cipher technique. While both the register shift and XOR functions are available in Ruby (>> and ^ respectively), they are implemented by hand to make it easier to understand the actual function of each.

### hex_xor(hex1, hex2)
Accepts two hexadecimals as strings. Returns a hexadecial stirng. Analagous to ^ Ruby method.
```Ruby
hex_xor('31bda77c', 'ff59001a') # => "CEE4A766"
#Ruby method
(0x31bda77c ^ 0xff59001a).to_s(16) #=> "cee4a766"
```

### crypt(data, initial_value)
Accepts a string to be encoded an hexadecimal integer value to serve as the starting key. Will also decrypt an encrypted string into its original form if given the same key.

```Ruby
crypt('Apple Jacks', 0x31bda77c) # => "*}B\xE7j\xAD\x18x\xA6\xF7<"
crypt("*}B\xE7j\xAD\x18x\xA6\xF7<", 0x31bda77c) # => "Apple Jacks"
```
