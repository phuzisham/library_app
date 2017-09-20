require('rspec')
require('pg')
require('book')
require('spec_helper')

describe(Book) do
  describe('.all') do
    it('is empty at first') do
      expect(Book.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a book to the array of saved books') do
      test_book = Book.new({:title => 'Old Man and the Sea', :id => nil})
      test_book.save()
      # binding.pry
      expect(Book.all()).to(eq([test_book]))
    end
  end

  describe("#==") do
    it("is the same book if it has the same title and id") do
      book = Book.new({:title => "Oceans Eleven", :id => nil})
      book2 = Book.new({:title => "Oceans Eleven", :id => nil})
      expect(book).to(eq(book2))
    end
  end

  describe(".find") do
    it("returns a book by its ID number") do
      test_book = Book.new({:title => "Oceans Eleven", :id => nil})
      test_book.save()
      test_book2 = Book.new({:title => "Oceans twelve", :id => nil})
      test_book2.save()
      expect(Book.find(test_book2.id())).to(eq(test_book2))
    end
  end

  describe("#update") do
    it("lets you update books in the database") do
      book = Book.new({:title => "Oceans Eleven", :id => nil})
      book.save()
      book.update({:title => "Oceans Twelve"})
      expect(book.title()).to(eq("Oceans Twelve"))
    end

    # it("lets you add an author to a book") do
    #   book = Book.new({:title => "Oceans Eleven", :id => nil})
    #   book.save()
    #   george = Author.new({:name => "George Clooney", :id => nil})
    #   george.save()
    #   brad = Author.new({:name => "Brad Pitt", :id => nil})
    #   brad.save()
    #   book.update({:author_id => [george.id(), brad.id()]})
    #   expect(book.authors()).to(eq([george, brad]))
    # end
  end

  # describe("#authors") do
  #   it("returns all of the authors in a particular book") do
  #     book = Book.new({:title => "Oceans Eleven", :id => nil})
  #     book.save()
  #     george = Author.new({:name => "George Clooney", :id => nil})
  #     george.save()
  #     brad = Author.new({:name => "Brad Pitt", :id => nil})
  #     brad.save()
  #     book.update({:author_id => [george.id(), brad.id()]})
  #     expect(book.authors()).to(eq([george, brad]))
  #   end
  # end

  describe("#delete") do
    it("lets you delete a book from the database") do
      book = Book.new({:title => "Oceans Eleven", :id => nil})
      book.save()
      book2 = Book.new({:title => "Oceans Twelve", :id => nil})
      book2.save()
      book.delete()
      expect(Book.all()).to(eq([book2]))
    end
  end
end
