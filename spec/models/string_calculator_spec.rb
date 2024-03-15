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
  end
end
