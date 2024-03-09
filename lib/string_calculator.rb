class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = ","
    if numbers.start_with?("//")
      custom_delimiters = numbers.scan(/\[(.*?)\]/).flatten.map { |d| Regexp.escape(d) }
      delimiter = Regexp.new(custom_delimiters.join("|"))
      numbers = numbers.split("\n", 2).last
    end

    numbers = numbers.gsub(/[\n]/, delimiter == "," ? "," : "")

    nums = numbers.split(delimiter).map(&:to_i).reject { |num| num > 1000 }
    negatives = nums.select { |num| num < 0 }
    if negatives.any?
      raise "negative numbers not allowed #{negatives.join(',')}"
    end

    nums.sum
  end
end