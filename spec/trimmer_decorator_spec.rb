require_relative '../trimmer_decorator'
require_relative '../person'

describe TrimmerDecorator do
  before(:all) do
    @person = Person.new(age: 23, name: 'Jimmy Nesham')
    @decorator = TrimmerDecorator.new(@person)
  end

  describe 'For the Trimmer Decorator Class' do
    it 'returns the name with a maximum of 10 characters' do
      expect(@decorator.correct_name.length).to eql 10
    end
  end
end
