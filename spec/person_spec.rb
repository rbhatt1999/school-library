require './person'

describe Person do
  before(:each) do
    @person = Person.new(age: 22, name: 'Mark', parent_permission: true)
  end
  it 'should tell the person age' do
    expect(@person).to have_attributes(name: 'Mark', age: 22, parent_permission: true)
  end
  it 'should have attributes' do
    expect(@person).to have_attributes(name: 'Mark', age: 22, parent_permission: true)
  end
  it 'should return the correct name' do
    expect(@person.correct_name).to eq 'Mark'
  end
  it 'should return true if the person is of age' do
    expect(@person.can_use_services?).to be(true)
  end
end
