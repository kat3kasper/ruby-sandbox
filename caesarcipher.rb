=begin

Implements both a forward and reverse caesar cipher. Expects the texts to be ciphered and the value to be specified as arguments when running the script

example
$> ruby caesar.rb "Text to be ciphers" -5

=end

def caesar (text, shift)

  if (text == nil || !text.is_a?(String))
    abort("Must include string to be ciphered")
  end

  shift = shift.to_i
  if (shift > 26)
    shift %= 26
  elsif (shift < -26)
    shift %= -26
  end
      
  0.upto(text.length) do |number|
    if (text[number] =~ /[A-Za-z]/)
      new_char = text[number].ord + shift
      if (shift > 0 && (new_char > "z".ord || new_char.between?("Z".ord+1, "Z".ord+shift)))
        new_char -= 26
      elsif (shift < 0 && (new_char < "A".ord || new_char.between?("a".ord+shift, "a".ord-1)))
        new_char += 26
      end
      print new_char.chr
    else
      print text[number]
    end
  end
end

l_text_to_cipher = ARGV[0]
l_shift = ARGV[1]

caesar(l_text_to_cipher, l_shift)