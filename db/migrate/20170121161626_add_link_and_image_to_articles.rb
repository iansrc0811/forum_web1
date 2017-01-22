class AddLinkAndImageToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :link, :string
    add_column :articles, :image, :string
  end
end
