class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name, null: false
      t.string :contact_no

      t.timestamps
    end
  end
end
