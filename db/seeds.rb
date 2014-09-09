#seed is a code snippet that adds stuff to a database. This will be executed with ActiveRecords by running
#'rake db:seed' on the database, a command which will look for a 'db/seed(s).rb' file.

contact_attributes = [
  { first_name: 'Eric', last_name: 'Kelly', phone_number: '1234567890' },
  { first_name: 'Adam', last_name: 'Sheehan', phone_number: '1234567890' },
  { first_name: 'Dan', last_name: 'Pickett', phone_number: '1234567890' },
  { first_name: 'Evan', last_name: 'Charles', phone_number: '1234567890' },
  { first_name: 'Faizaan', last_name: 'Shamsi', phone_number: '1234567890' },
  { first_name: 'Helen', last_name: 'Hood', phone_number: '1234567890' },
  { first_name: 'Corinne', last_name: 'Babel', phone_number: '1234567890' }
]


#this block will iterate over each element of the 'contact_attributes' array, initialize a new Contact object
#with its contents and save it on the database.
contact_attributes.each do |contact|
  contact = Contact.new(contact)
  contact.save
  #the command 'Contact.create(contact)' would be equivalent of the two lines above.
end
