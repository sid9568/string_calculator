class StringCalculator
   def self.add(numbers)
     return 0 if numbers.empty?

    delimiter = /,|\n/

    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      custom_delimiter = parts[0][2..-1]
      delimiter = Regexp.escape(custom_delimiter)
      numbers = parts[1]
    end

    nums = numbers.split(/#{delimiter}/).map(&:to_i)

    negatives = nums.select { |n| n < 0 }
    unless negatives.empty?
      raise "negative numbers not allowed #{negatives.join(', ')}"
    end

    nums.sum
   end
end

puts StringCalculator.add("")
puts StringCalculator.add("1")
puts StringCalculator.add("1,5")
puts StringCalculator.add("1\n2,3")
puts StringCalculator.add("//;\n1;2")