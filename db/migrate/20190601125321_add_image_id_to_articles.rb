class AddImageIdToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :image_id, :string
  end
end
