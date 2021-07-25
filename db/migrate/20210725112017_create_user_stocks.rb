class CreateUserStocks < ActiveRecord::Migration[6.1]
  def change
    drop_table :user_stocks

    create_table :user_stocks do |t|
      t.integer :user_id
      t.integer :stock_id
    end
  end
end
