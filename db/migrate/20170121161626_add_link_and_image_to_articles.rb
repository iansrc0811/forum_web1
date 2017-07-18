class AddLinkAndImageToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :link, :string
    add_column :articles, :image, :string
  end
end
