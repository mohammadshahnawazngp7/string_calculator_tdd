class StringCalculator < ApplicationRecord
  def self.add(numbers)
    return 0 if numbers.empty?
    delimiter = ','
    if numbers.start_with?("//")
      delimiter_line, numbers = numbers.split("\n", 2)
      delimiter = delimiter_line[2..-1]
      if delimiter.include?('][')
        delimiter = delimiter[1..-2].split('][')
      elsif delimiter.start_with?("[") && delimiter.end_with?("]")
        delimiter = delimiter[1..-2] # remove brackets
        delimiter = delimiter.split('][')
      end
    end

    delimiter = [delimiter] unless delimiter.is_a?(Array)

    delimiter.each do |delim|
      numbers.gsub!("\n", delim)
    end

    numbers.split(Regexp.union(delimiter)).map(&:to_i).each do |num|
      raise "negatives not allowed: #{num}" if num.negative?
    end

    numbers.split(Regexp.union(delimiter)).map(&:to_i).reject { |num| num > 1000 }.sum
  end
end
