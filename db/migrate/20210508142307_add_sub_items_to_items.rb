class AddSubItemsToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :sub_items, :jsonb
  end
end
