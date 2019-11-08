class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :email, index: { unique: true }, null: false, default: ""
      t.string :password_digest
      t.integer :account_type
      t.boolean :verified, default: false, null: false
      t.string :phone_number, null: false, index: { unique: true }, default: ""

      t.timestamps
    end
  end
end
