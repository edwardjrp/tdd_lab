class AddNameIsbnToBook < ActiveRecord::Migration
  def change
    add_column :books, :name, :string
    add_column :books, :isbn, :string
  end
end
