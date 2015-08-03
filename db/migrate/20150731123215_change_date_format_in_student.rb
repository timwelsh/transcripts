class ChangeDateFormatInStudent < ActiveRecord::Migration
  def change
  	change_column :students, :completion_year, :string, array: true, default: []
  end
end
