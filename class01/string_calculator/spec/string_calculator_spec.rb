require 'spec_helper'
require 'string_calculator'

describe StringCalculator do
  describe '.add' do
    it 'Should return 0 if string is empty' do
      expect(
        StringCalculator.add('')
      ).to eq 0
    end

    it 'Should return 0 if no arguments' do
      expect(
        StringCalculator.add
      ).to eq 0
    end

    it 'should return the number' do
      expect(
        StringCalculator.add('2')
      ).to eq 2
    end

    it 'should return sum of 2 numbers' do
      expect(
        StringCalculator.add('2,2')
      ).to eq 4
    end

    it 'should return sum of more than 2 numbers' do
      expect(
        StringCalculator.add('5,4,3,4')
      ).to eq 16
    end

    it 'should return sum of numbers with new line' do
      expect(
        StringCalculator.add('1\n2,3')
      ).to eq 6
    end

    it 'should return sum of numbers with special delimeter' do
      expect(
        StringCalculator.add('//;\n1;2;3')
      ).to eq 6
    end

    it 'should return sum of numbers with \n delimeter' do
      expect(
        StringCalculator.add('//\n\n1\n2\n3')
      ).to eq 6
    end

    it 'should return error if negative' do
      expect do
        StringCalculator.add('-1,-9,2,3')
      end.to raise_error 'Negative numbers not allowed: -1,-9'
    end
  end
end
