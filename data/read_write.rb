require 'json'
def save_persons
  person_store = @persons.map do |person|
    if person.instance_of?(Teacher)
      {
        occupation: 'Teacher',
        name: person.name,
        age: person.age,
        specialization: person.specialization
      }
    else
      {
        occupation: 'Student',
        name: person.name,
        age: person.age,
        parent_permission: person.parent_permission
      }
    end
  end
  open_file('./data/people.json', person_store)
end

def open_file(directory, file_name)
  File.new(directory, 'w') unless File.exist?(directory)
  File.open(directory, 'w') do |file|
    file.puts(JSON.pretty_generate(file_name))
  end
end

def read_person
  if File.exist?('./data/people.json')
    File.open('./data/people.json', 'r') do |file|
      person_store = JSON.parse(file.read)
      person_store.each do |person|
        @persons << if person['occupation'] == 'Student'
                      Student.new(age: person['age'], name: person['name'],
                                  parent_permission: person['parent_permission'])
                    else
                      Teacher.new(person['specialization'], person['age'], person['name'])
                    end
      end
    end
  else
    []
  end
end

def save_books
  book_store = @books.map do |book|
    {
      title: book.title,
      author: book.author
    }
  end
  File.new('./data/books.json', 'w') unless File.exist?('./data/books.json')
  File.open('./data/books.json', 'w') do |file|
    file.puts(JSON.pretty_generate(book_store))
  end
end

def read_books
  if File.exist?('./data/books.json')
    File.open('./data/books.json', 'r') do |file|
      book_store = JSON.parse(file.read)
      book_store.each do |book|
        @books << Book.new(book['title'], book['author'])
      end
    end
  else
    []
  end
end

def save_rentals
  rental_store = @rentals.map do |rental|
    {
      date: rental.date,
      person_index: @persons.index(rental.person),
      book_index: @books.index(rental.book)
    }
  end
  File.new('./data/rentals.json', 'w') unless File.exist?('./data/rentals.json')
  File.open('./data/rentals.json', 'w') do |file|
    file.puts(JSON.pretty_generate(rental_store))
  end
end

def read_rentals
  if File.exist?('./data/rentals.json')
    File.open('./data/rentals.json', 'r') do |file|
      rental_store = JSON.parse(file.read)
      rental_store.each do |rental|
        @rentals << Rental.new(rental['date'], @persons[rental['person_index']], @books[rental['book_index']])
      end
    end
  else
    []
  end
end
