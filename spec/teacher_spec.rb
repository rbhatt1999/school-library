require_relative '../teacher'

describe Teacher do
  context 'For the class Teacher' do
    teacher = Teacher.new('Power', 31, 'Lucas')
    it 'creates a new teacher with the name "Lucas and age 31"' do
      expect(teacher.name).to eql "Lucas"
      expect(teacher.age).to eql 31
    end

    it 'should have always permission to use services' do
      expect(teacher.can_use_services?).to eq true
    end
  end
end