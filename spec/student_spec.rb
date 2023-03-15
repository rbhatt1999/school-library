require './student'
require './classroom'

describe Student do
  context 'Student class' do
    before(:all) do
      @student = Student.new(age: 100, classroom: 'classroom', name: 'Verissimo', parent_permission: true)
    end

    it 'should return all the student attribute' do
      expect(@student).to have_attributes(age: 100, classroom: 'classroom', name: 'Verissimo', parent_permission: true)
    end

    context 'Student subject ' do
      it 'the student should have an Math classroom' do
        std_sub = Student.new(age: 200, name: 'Verissimo')
        math = Classroom.new('Math')
        std_sub.classroom = math
        expect(std_sub.classroom.label).to eq 'Math'
      end
    end

    context 'Student classroom count' do
      it 'should return the count of a subject' do
        std_sub = Student.new(age: 200, classroom: 'English', name: 'Verissimo')
        math = Classroom.new('English')
        std_sub.classroom = math
        expect(math.students.count).to eq 1
      end
    end
  end
end
