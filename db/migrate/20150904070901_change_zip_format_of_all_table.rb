class ChangeZipFormatOfAllTable < ActiveRecord::Migration
  def change
  	change_column :students, :zip, :string
  	change_column :schools, :zip, :string
  	change_column :users, :zip, :string
  end
end
