require_relative '../book'

describe Book do
	
	context 'Should create a book ' do
		book = Book.new('Why Nations Fail', 'James')
		it 'should return title of a book as Why Nations fail' do
			expect(book.title).to eql 'Why Nations Fail'
		end	
	end

	context 'Should create a book ' do
		book = Book.new('Harry Potter', 'J K Rowling')
		it 'should return author of a book as J K Rowling' do
			expect(book.author).to eql 'J K Rowling'
		end	
	end
	end