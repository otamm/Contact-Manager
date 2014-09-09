require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

require_relative 'models/contact'

# before do
#   contact_attributes = [
#     { first_name: 'Eric', last_name: 'Kelly', phone_number: '1234567890' },
#     { first_name: 'Adam', last_name: 'Sheehan', phone_number: '1234567890' },
#     { first_name: 'Dan', last_name: 'Pickett', phone_number: '1234567890' },
#     { first_name: 'Evan', last_name: 'Charles', phone_number: '1234567890' },
#     { first_name: 'Faizaan', last_name: 'Shamsi', phone_number: '1234567890' },
#     { first_name: 'Helen', last_name: 'Hood', phone_number: '1234567890' },
#     { first_name: 'Corinne', last_name: 'Babel', phone_number: '1234567890' }
#   ]

#   @contacts = contact_attributes.map do |attr|
#     Contact.new(attr)
#   end
# end
##### this whole block has equivalent function of the 'Contact.all' command (the '.all' method comes from ActiveRecord::Base)
##### Search for 'ActiveRecord Query Interface'

get '/' do
  @contacts = Contact.all
  erb :index
end

get '/contacts' do
  page = params[:page] ||= 1
  @contacts_page = Contact.limit(3).offset((page.to_i * 3) - 3)
  if params[:search] == nil
    @contacts = Contact.limit(3).offset((page.to_i * 3) - 3)
  else
    search = "%#{params[:search].gsub(' ','+')}%"
    @contacts = @contacts_page.where("CONCAT(first_name, last_name) ILIKE :search",{search: search})
  end
  erb :index
end

get '/contacts/:id' do
  @id = params[:id]
  @contact = Contact.find(@id)
  erb :show
end

get '/new' do
  erb :new_contact
end

post '/new' do
  @name = params[:name]
  @last_name = params[:last_name]
  @number = params[:phone_number]
  redirect '/new' if @name.size == 0 || @last_name.size == 0 || @number.size == 0
  Contact.create_contact(@name,@last_name,@number)
  redirect '/new'
end
