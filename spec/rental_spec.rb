require './rental'
require './person'
require './book'

describe Rental do
  it 'Rental Class' do
    date = '4/2/22'
    book = Book.new('Moonshot', 'Cole')
    person = Person.new(age:23, name:'anne')
    rental = Rental.new(date, person, book)
    expect(rental.person.name).to eql('anne')
    expect(rental.person.age).to eql(23)
    expect(rental.book.title).to eql('Moonshot')
    expect(rental.book.author).to eql('Cole')
  end
end