class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.text :address
      t.text :description
      t.string :phone

      t.timestamps null: false
    end
  end
end
