class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :transaction_id
      t.timestamp :created
      t.string :status
      t.boolean :paid
      t.integer :refunded
      t.string :card_id
      t.integer :last4
      t.string :brand
      t.string :funding
      t.integer :expiry_month
      t.integer :expiry_year
      t.string :customer
      t.string :bal_transactions
      t.references :subscription, index: true

      t.timestamps null: false
    end
    add_foreign_key :transactions, :subscriptions
  end
end
