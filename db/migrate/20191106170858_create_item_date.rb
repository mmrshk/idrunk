class CreateItemDate < ActiveRecord::Migration[6.0]
  def change
    create_table :item_dates do |t|
      t.belongs_to :user, foreign_key: true, index: true
      t.belongs_to :item, foreign_key: true, index: true
      t.boolean :available, default: true
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false

      t.timestamps
    end
  end
end
