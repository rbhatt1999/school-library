require_relative '../capitalize_decorator'
require_relative '../person'

describe CapitalizeDecorator do
  before(:all) do
    @person = Person.new(age: 26, name: 'obama')
    @capitalize = CapitalizeDecorator.new(@person)
  end

  describe 'For the CapitalizeDecorator class' do
    it 'returns the given name "obama" with the capitalized first letter' do
      expect(@capitalize.correct_name).to eql 'Obama'
    end
  end
end
