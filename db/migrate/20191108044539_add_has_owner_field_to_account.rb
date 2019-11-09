class AddHasOwnerFieldToAccount < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :owner_mode, :boolean, default: false
  end
end
