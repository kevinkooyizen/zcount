class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.date :birthdate
      t.decimal :monthly_income, precision: 8, scale: 2
      t.decimal :monthly_expense, precision: 8, scale: 2
      t.integer :epf, default: 8, limit: 2

      t.timestamps
    end
  end
end
