class CreatePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :phones do |t|
      t.string :phone
      t.string :phone_type
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
