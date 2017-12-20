class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.date :birthdate
      t.decimal :month_income, precision: 8, scale: 2
      t.decimal :month_expense, precision: 8, scale: 2
      t.decimal :epf, precision: 2, scale: 2, default: 0.08

      t.timestamps
    end
  end
end
