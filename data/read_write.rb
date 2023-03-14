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