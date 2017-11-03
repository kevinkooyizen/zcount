class CreateIncomes < ActiveRecord::Migration[5.1]
  def change
    create_table :incomes do |t|
      t.float :monthly
      t.float :yearly
      t.float :daily
      t.float :pay_per_hour

      t.timestamps
    end
  end
end
