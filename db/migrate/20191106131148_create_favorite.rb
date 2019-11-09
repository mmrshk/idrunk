class CreateFavorite < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.belongs_to :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
