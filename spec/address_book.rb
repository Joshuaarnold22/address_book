require_relative '../models/address_book.rb'

RSpec.describe AddressBook do
  context "attributes" do
    it "should respond to entries" do
      book = AddressBook.new
      expect(book).to respond_to(:entries)
    end

    it "should initialize entries as an array" do
      book = AddressBook.new
      expect(book.entries).to be_a(Array)
    end

    it "should initialize entries as empty" do
      book = AddressBook.new
      expect(book.entries.size).to eq 0
    end
  end

  context "#add_entry" do
    it "adds only one entry to the address book" do
      book = AddressBook.new
      book.add_entry('Josh Arnold', '423-676-8069', 'joshuaarnold22@gmail.com')

      expect(book.entries.size).to eq 1
    end

    it "adds the correct information to entries" do
      book = AddressBook.new
      book.add_entry('Josh Arnold', '423-676-8069', 'joshuaarnold22@gmail.com')
      new_entry = book.entries[0]

      expect(new_entry.name).to eq 'Josh Arnold'
      expect(new_entry.phone_number).to eq '423-676-8069'
      expect(new_entry.email).to eq 'joshuaarnold22@gmail.com'
    end
  end

  context "#remove_entry" do
    it "removed only one entry to the address book" do
      book = AddressBook.new
      book.add_entry('Josh Arnold', '423-676-8069', 'joshuaarnold22@gmail.com')

      name = "Testing"
      phone_number = "Another test"
      email = "Last test"
      book.add_entry(name, phone_number, email)

      expect(book.entries.size).to eq 2

      book.remove_entry('Josh Arnold', '423-676-8069', 'joshuaarnold22@gmail.com')

      expect(book.entries.size).to eq 1
    end
  end
end
