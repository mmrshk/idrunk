class CreateFeaturedList < ActiveRecord::Migration[6.0]
  def change
    create_table :featured_list do |t|
      t.belongs_to :institution, index: true, foreign_key: true
      t.belongs_to :favorite, index: true, foreign_key: true

      t.timestamps
    end
  end
end
