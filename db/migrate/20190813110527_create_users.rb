class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.belongs_to :account, index: true
      t.timestamps
    end
  end
end
