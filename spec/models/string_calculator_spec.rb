require 'rails_helper'

RSpec.describe StringCalculator, type: :model do
  describe '.add' do
    context 'when given an empty string' do
      it 'returns 0' do
        expect(StringCalculator.add('')).to eq(0)
      end
    end

    context 'when given a single number' do
      it 'returns the number' do
        expect(StringCalculator.add('5')).to eq(5)
      end
    end

    context 'when given numbers with new lines between them' do
      it 'returns the sum of the numbers' do
        expect(StringCalculator.add("1\n2,3")).to eq(6)
      end
    end

    context 'when given a custom delimiter' do
      it 'returns the sum of the numbers' do
        expect(StringCalculator.add("//;\n1;2")).to eq(3)
      end
    end

    context 'when given a negative number' do
      it 'raises an exception' do
        expect { StringCalculator.add("-1") }.to raise_error(RuntimeError, "negatives not allowed: -1")
      end
    end

    context 'when given numbers bigger than 1000' do
      it 'ignores numbers bigger than 1000' do
        expect(StringCalculator.add("2,1001")).to eq(2)
      end
    end

    context 'when given a delimiter of any length' do
      it 'returns the sum of the numbers' do
        expect(StringCalculator.add("//[***]\n1***2***3")).to eq(6)
      end
    end

    context 'when given multiple delimiters' do
      it 'returns the sum of the numbers' do
        expect(StringCalculator.add("//[*][%]\n1*2%3")).to eq(6)
      end
    end

    context 'when given multiple delimiters with length longer than one char' do
      it 'returns the sum of the numbers' do
        expect(StringCalculator.add("//[***][%%%]\n1***2%%%3")).to eq(6)
      end
    end
  end
end
