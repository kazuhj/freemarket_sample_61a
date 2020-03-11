class CreateTelephones < ActiveRecord::Migration[5.2]
  def change
    create_table :telephones do |t|

      t.timestamps
    end
  end
end
