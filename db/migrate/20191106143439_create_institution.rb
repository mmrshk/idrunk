class CreateInstitution < ActiveRecord::Migration[6.0]
  def change
    create_table :institutions do |t|
      t.belongs_to :account, index: true, foreign_key: true
      t.integer :institution_type
      t.string :name, null: false
      t.float :latitude, index: true
      t.float :longitude, index: true
      t.string :address

      t.timestamps
    end
  end
end
