require_relative 'app'

class Main
  def initialize
    @a1 = App.new
  end

  def list_of_options
    puts
    puts 'Please choose an option by entering a number:'
    puts '1 - list all books'
    puts '2 - list all people'
    puts '3 - create a person'
    puts '4 - create a book'
    puts '5 - create a renter'
    puts '6 - list all renters for a given person id'
    puts '7 - Exit'
  end
  def option(input)
    case input
    when '1'
      @a1.list_all_books
    when '2'
      @a1.list_all_persons
    when '3'
      @a1.create_person
    when '4'
      @a1.create_book
    when '5'
      @a1.create_rental
    when '6'
      @a1.list_all_rentals
    else
      puts 'Please enter a number between 1 and 7'
    end
  end
end

m1 = Main.new
m1.start_console
