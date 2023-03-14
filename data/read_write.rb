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
  unless File.exist?('people.json')
    File.new("people.json" , "w")
  end
  File.open('./data/people.json', 'w') do |file|
    file.puts(JSON.pretty_generate(person_store))
  end
end

def read_person
  if File.exist?('./data/people.json')
    File.open('./data/people.json', 'r') do |file|
      person_store = JSON.parse(file.read)
      person_store.each do |person|
        if person['occupation'] == 'Student'
          @persons << Student.new(age: person['age'], name: person['name'], parent_permission: person['parent_permission'])
        else
          @persons << Teacher.new(person['specialization'], person['age'], person['name'])
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
  unless File.exist?('./data/books.json')
    File.new('./data/books.json', 'w')
  end
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
  unless File.exist?('./data/rentals.json')
    File.new('./data/rentals.json', 'w')
  end
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
