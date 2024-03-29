require 'spec_helper'
describe Interpolate::Interpolator do
  subject { Interpolate::Interpolator }

  before do
    @mapping = { 'day'  => 'Thursday', 'name' => 'Billy' }
  end

  describe '.substitute' do
    before do
      @template = '${name} has an appointment on ${day}'
    end

    it 'should substitute the variables in the template' do
      result = subject.substitute @template, @mapping
      expect(result).to eq('Billy has an appointment on Thursday')
    end
  end

  context 'when a variable has not been assigned' do
    before do
      @template = '${first_name} has an appointment on ${day}'
    end

    it 'should raise an error' do
      expect {
        subject.substitute @template, @mapping
      }.to raise_error(ArgumentError)
    end
  end

  context 'when an escape sequence has been declared' do
    before do
      @template = 'hello ${${name}}'
    end

    it 'should only perform substitution on the inner variable' do
      result = subject.substitute @template, @mapping
      expect(result).to eq('hello ${Billy}')
    end
  end

  context 'when there is no variable' do
    before do
      @template = 'hello $$'
    end

    it 'should escape with no substitution' do
      result = subject.substitute @template, @mapping
      expect(result).to eq('hello $')
    end
  end
end
