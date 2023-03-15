require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before(:all) do
    @new_classroom = Classroom.new('Mathematics')
    @student = Student.new(age: 20, classroom: 'classroom', name: 'Wahaj')
    @new_classroom.add_student(@student)
  end

  describe 'For the class Classroom' do
    it 'should return the label of the classroom' do
      expect(@new_classroom.label).to eql 'Mathematics'
    end
  end

  context 'Student classroom count' do
    it 'should return the count of a subject' do
      std_sub = Student.new(age: 21, classroom: 'English', name: 'Rohiy')
      math = Classroom.new('English')
      std_sub.classroom = math
      expect(math.students.count).to eq 1
    end
  end
end
