class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string     :customer_number, null: false
      t.integer    :year,            null: false
      t.integer    :month,           null: false
      t.integer    :security_code,   null: false
      t.references :user
      t.timestamps
    end
  end
end
