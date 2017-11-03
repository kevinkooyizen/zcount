class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.integer :daily
      t.integer :monthly
      t.integer :yearly

      t.timestamps
    end
  end
end
