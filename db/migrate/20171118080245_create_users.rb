class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.date :birthdate
      t.float :monthly_income
      t.float :monthly_expense

      t.timestamps
    end
  end
end
