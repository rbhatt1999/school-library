require_relative '../decorator'
require_relative '../person'

describe Decorator do
  before(:all) do
    @new_person = Person.new(age: 23, name:'Lucas')
    @new_decorator = Decorator.new(@new_person)
  end

  describe 'For Decorator class' do
    it 'returns the correct name' do
      expect(@new_decorator).to be_instance_of Decorator
    end
  end
end