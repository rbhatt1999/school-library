require './teacher'

describe Teacher do
  before(:all) do
    @teacher = Teacher.new('JavaScript', 66, 'Barry')
  end
  it 'Teacher class' do
    expect(@teacher).to have_attributes(age: 66, specialization: 'JavaScript', name: 'Barry')
  end

  it 'Teacer can use services' do
    expect(@teacher.can_use_services?).to be(true)
  end
end
