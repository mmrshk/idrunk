class CreateCategory < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :title, unique: true, null: false
      t.belongs_to :institution, index: true, foreign_key: true
      t.references :parent

      t.timestamps
    end
  end
end
