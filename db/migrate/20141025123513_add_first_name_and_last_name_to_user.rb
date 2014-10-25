class AddFirstNameAndLastNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :surname, :string
    add_column :users, :image, :string
  end
end
