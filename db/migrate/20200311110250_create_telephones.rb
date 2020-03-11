class CreateTelephones < ActiveRecord::Migration[5.2]
  def change
    create_table :telephones do |t|
      t.string     :tel,  null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
