require 'minitest/autorun'
require_relative 'zalik'

class ContactsTest < Minitest::Test
  def setup
    @phone_book = PhoneBook.new
    @contact1 = FullContact.new("John", "123456789", "Doe")
    @contact2 = FullContact.new("John", "987654321", "Smith")
    @phone_book.add(@contact1)
    @phone_book.add(@contact2)
    @phone_book.merge_contacts(@contact1, @contact2)
  end

  def test_contact_merge
    assert_equal(1, @phone_book.contacts.length)
    merged_contact = @phone_book.contacts.first
    assert_equal("John", merged_contact.contactName)
    assert_equal("123456789", merged_contact.contactPhone)
    assert_equal("Doe", merged_contact.contactSurname)
  end

  def test_search
    search_result = @phone_book.search(contactName: "John")
    assert_equal(1, search_result.count)
    assert_equal(@phone_book.contacts.first, search_result.first)
  end

  def test_sort_by_name
    sorted_contacts = @phone_book.sortByName
    assert_equal(1, sorted_contacts.length)
    assert_equal("John", sorted_contacts.first.contactName)
  end

  def test_sort_by_surname
    sorted_contacts = @phone_book.sortBySurname
    assert_equal(1, sorted_contacts.length)
    assert_equal("Doe", sorted_contacts.first.contactSurname)
  end
end
