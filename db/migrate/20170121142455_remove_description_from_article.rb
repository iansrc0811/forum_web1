class RemoveDescriptionFromArticle < ActiveRecord::Migration
  def change
    remove_column :articles, :description, :string
  end
end
