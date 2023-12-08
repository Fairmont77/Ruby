class Contact
  attr_accessor :contactName, :id

  @@next_id = 1

  def initialize(contactName = "-")
    @contactName = contactName
    @id = @@next_id
    @@next_id += 1
  end

  def to_s
    "Info: #{@contactName}"
  end
end

class FullContact < Contact
  attr_accessor :contactPhone, :contactSurname

  def initialize(contactName = "-", contactPhone = "-", contactSurname = "-")
    super(contactName)
    @contactPhone = contactPhone
    @contactSurname = contactSurname
  end

  def to_s
    "Name: #{@contactName} #{@contactSurname}, phone: #{@contactPhone}"
  end
end

class BloggerContact < FullContact
  attr_accessor :contactBlog

  def initialize(contactName = "-", contactPhone = "-", contactSurname = "-", contactBlog = "no messenger")
    super(contactName, contactPhone, contactSurname)
    @contactBlog = contactBlog
  end

  def to_s
    "Name: #{@contactName} #{@contactSurname}, phone: #{@contactPhone}, Blog: #{@contactBlog}"
  end
end

class PhoneBook
  attr_accessor :contacts

  def initialize
    @contacts = []
  end

  def add(contact)
    @contacts << contact
  end

  def merge_contacts(contact1, contact2)
    if contact1.contactName == contact2.contactName
      merged_contact = FullContact.new(contact1.contactName, contact1.contactPhone, contact1.contactSurname)
      merged_contact.contactBlog = contact1.contactBlog if contact1.is_a?(BloggerContact)
      merged_contact.contactBlog = contact2.contactBlog if contact2.is_a?(BloggerContact)

      @contacts.reject! { |contact| [contact1.id, contact2.id].include?(contact.id) }

      add(merged_contact)
    end
  end

  def search(criteria)
    @contacts.select do |contact|
      criteria.any? do |key, value|
        contact.respond_to?(key) && contact.send(key).include?(value)
      end
    end
  end

  def sortByName
    @contacts.sort_by(&:contactName)
  end

  def sortBySurname
    @contacts.sort_by(&:contactSurname)
  end

  def to_s
    @contacts.map(&:to_s).join("\n")
  end
end
