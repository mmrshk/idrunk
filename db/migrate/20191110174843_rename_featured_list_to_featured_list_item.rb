class RenameFeaturedListToFeaturedListItem < ActiveRecord::Migration[6.0]
  def change
    rename_table :featured_lists, :featured_list_items
  end
end
