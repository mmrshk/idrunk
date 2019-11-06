class CreateItem < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.belongs_to :category, index: true, foreign_key: true
      t.float :cost, null: false, default: 0.0
      t.boolean :has_discount,  null: false, default: false

      t.timestamps
    end
  end
end
