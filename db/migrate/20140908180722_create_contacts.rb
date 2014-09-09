class CreateContacts < ActiveRecord::Migration
  def change
    #this will create the table and define the names of its columns.
    create_table :contacts do |table|
      #each of these will create a column and the type of the data on it (all strings in this case)
      table.string :first_name
      table.string :last_name
      table.string :phone_number
    end
  end
end
