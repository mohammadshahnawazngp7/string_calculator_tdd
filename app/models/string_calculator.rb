class StringCalculator < ApplicationRecord
  def self.add(numbers)
    return 0 if numbers.empty?
    delimiter = ','
    if numbers.start_with?("//")
      delimiter_line, numbers = numbers.split("\n", 2)
      delimiter = delimiter_line[2..-1]
    end

    numbers.gsub!("\n", delimiter)

    numbers.split(delimiter).map(&:to_i).sum
  end
end
