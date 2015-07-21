class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :item
      t.decimal :min_amount
      t.decimal :max_amount

      t.timestamps null: false
    end
  end
end
