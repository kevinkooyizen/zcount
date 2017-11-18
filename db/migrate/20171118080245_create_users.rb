class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.date :birthdate
      t.float :yearly_income
      t.float :monthly_income
      t.float :daily_income
      t.float :hourly_income
      t.float :yearly_expense
      t.float :monthly_expense
      t.float :net_income

      t.timestamps
    end
  end
end
