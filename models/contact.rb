class Contact < ActiveRecord::Base
#  attr_reader :first_name, :last_name, :phone_number   ###these are optional/preferably removed, because
#  the Base module of ActiveRecord automatically creates attr_accessor methods of the @attributes (each of which
#  a field on the 'contacts' table). The initialize method can also be removed, because the 'initialize' method of
#  the ActiveRecord::Base also takes an array of hashes as input, and this method is inherited.

#   def initialize(attributes)
#     @first_name = attributes[:first_name]
#     @last_name = attributes[:last_name]
#     @phone_number = attributes[:phone_number]
#   end

  def name
    [first_name, last_name].join(' ')
  end

  def self.create_contact(contact,last_name,number)
    raise 'Fill all the fields correctly' if contact.size == 0 || number.size == 0 || last_name.size == 0
    contact_info = {first_name: contact,last_name: last_name,phone_number: number}
    Contact.create(contact_info)
  end


end
