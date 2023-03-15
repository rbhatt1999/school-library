require './book'

describe Book do
  context 'Book class' do
    before(:all) do
      @book = Book.new('Killer Queen', 'Annie')
    end
    it 'should return the book attributes' do
      expect(@book).to have_attributes(title: 'Killer Queen', author: 'Annie')
    end
  end
end