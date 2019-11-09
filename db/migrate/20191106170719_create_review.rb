class CreateReview < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :institution, foreign_key: true, index: true
      t.belongs_to :user, foreign_key: true, index: true
      t.float :rating, null: false, default: 0.0

      t.timestamps
    end
  end
end
