require_relative '../person'

describe Person do
  context 'When a new person is created' do
    person = Person.new(age: 25, name: 'Rohit', parent_permission: true)
    another_person = Person.new(age: 15, name: 'Jitendar', parent_permission: false)
    it 'should return true if he can use service for a person wtih age greater than 18' do
      expect(person.can_use_services?).to eq true
    end

    it 'should return false if he can use service for a person with age less than 18' do
      expect(another_person.can_use_services?).to eq false
    end

  end
end