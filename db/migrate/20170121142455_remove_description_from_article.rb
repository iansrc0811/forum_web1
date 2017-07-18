class RemoveDescriptionFromArticle < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :description, :string
  end
end
