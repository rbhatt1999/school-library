require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'classroom'
require_relative 'rental'
require './data/read_write'

class App
  def initialize
    @books = []
    @persons = []
    @rentals = []
    read_person
    read_books
    read_rentals
  end

  def list_all_books
    puts 'Database is empty! Add a book.' if @books.empty?
    @books.each { |book| puts "[Book] Title: #{book.title}, Author: #{book.author}" }
  end

  def list_all_persons
    puts 'Database is empty! Add a person.' if @persons.empty?
    @persons.each do |person|
      puts "[#{person.class.name}] Name: #{person.name}, Age: #{person.age}, id: #{person.id}"
    end
  end

  def create_person
    print 'press 1 to create a student, press 2 to create a teacher : '
    option = gets.chomp

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid input. Try again'
    end
  end

  def create_student
    puts 'create a new student'
    print 'Enter student age: '
    age = gets.chomp.to_i
    print 'Enter name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    case parent_permission
    when 'n'
      student = Student.new(age: age, name: name, parent_permission: false, classroom: @classroom)

      puts 'Student created successfully'
    when 'y'
      student = Student.new(age: age, name: name, parent_permission: true, classroom: @classroom)
      puts 'Student created successfully'
    end
    @persons << student
    save_persons
  end

  def create_teacher
    puts 'create a new teacher'
    print 'Enter teacher age: '
    age = gets.chomp.to_i
    print 'Enter teacher specialization: '
    specialization = gets.chomp
    print 'Enter teacher name: '
    name = gets.chomp
    teacher = Teacher.new(specialization, age, name)
    @persons << teacher
    save_persons
    puts 'Teacher created successfully'
  end

  def create_book
    puts 'create a new book'
    print 'Enter title: '
    title = gets.chomp
    print 'Enter author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts "Book #{title} created successfully."
    save_books
  end

  def create_rental
    puts 'select the book you want to rent by entering it\'s number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_id = gets.chomp.to_i
    return puts 'sorry wrong input' unless (0...@books.length).include?(book_id)

    puts 'select person from the list by its number'
    tem_person = @persons.select(&:can_use_services?)
    tem_person.each_with_index do |person, index|
      puts "#{index} [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_id = gets.chomp.to_i
    unless (0...tem_person.length).include?(person_id)
      puts 'sorry wrong input'
      return
    end
    print 'Date: '
    date = gets.chomp.to_s
    rental = Rental.new(date, tem_person[person_id], @books[book_id])
    @rentals << rental
    save_rentals
    puts 'Rental created successfully'
  end

  def list_all_rentals
    puts 'To see rentals enter the person ID: '
    id = gets.chomp.to_i

    puts 'Rented Books: '
    @rentals.each do |rental|
      if rental.person.id == id
        puts "Person: #{rental.person.name} Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      else
        puts
        puts 'No record were found for the given ID'
      end
    end
  end
end
