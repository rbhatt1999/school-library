require_relative '../student'
require_relative '../classroom'
# require_relative '../person'

describe Student do
  context 'For the class Student' do
    classroom = Classroom.new('Maths')
    student = Student.new(age: 23, classroom: 'Maths', name: 'Wajid', parent_permission: true)

    it 'creates a student with name "Wajid"' do
      expect(student.name).to eql 'Wajid'
    end

    it 'should return a message(emoji) for a certain method' do
      expect(student.play_hooky).to eql "¯(ツ)/¯"
    end

    it 'adds student to classroom' do
      expect(student.classroom).to eq 'Maths'
    end

  end
end