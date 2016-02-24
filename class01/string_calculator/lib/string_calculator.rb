class StringCalculator
  def self.add(string = '')
    d = string.start_with?('//') ? string[2] : ','
    numbers = string.gsub('\n', d).split(d).map(&:to_i)
    negatives = numbers.select { |n| n < 0 }
    fail "Negative numbers not allowed: #{negatives.join(',')}" if negatives.any?
    numbers.reduce(0, :+)
  end
end
