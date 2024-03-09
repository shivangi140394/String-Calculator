require 'string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe "#add" do
    it "returns 0 for an empty string" do
      expect(calculator.add("")).to eq(0)
    end

    it "returns the number itself for a single number" do
      expect(calculator.add("1")).to eq(1)
    end

    it "returns the sum of two numbers" do
      expect(calculator.add("1,5")).to eq(6)
    end

    it "returns the sum of multiple numbers" do
      expect(calculator.add("1,2,3,4,5")).to eq(15)
    end

    it "allows newline as delimiter and returns the sum" do
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it "allows custom delimiter and returns the sum" do
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it "throws an exception for negative numbers" do
      expect { calculator.add("-1,2,-3") }.to raise_error("negative numbers not allowed -1,-3")
    end

    it "ignores numbers greater than 1000" do
      expect(calculator.add("2,1001,6")).to eq(8)
    end

    it "handles custom delimiter of any length" do
      expect(calculator.add("//[***]\n1***2***3")).to eq(6)
    end

    it "handles multiple custom delimiters" do
      expect(calculator.add("//[*][%]\n1*2%3")).to eq(6)
    end

    it "handles multiple custom delimiters with any length" do
      expect(calculator.add("//[**][%%]\n1**2%%3")).to eq(6)
    end
  end
end
