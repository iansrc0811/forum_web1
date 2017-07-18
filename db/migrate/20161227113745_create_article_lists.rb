class CreateArticleLists < ActiveRecord::Migration[5.0]
  def change
    create_table :article_lists do |t|
      t.references :list, index: true, foreign_key: true
      t.references :article, index: true, foreign_key: true
    end
  end
end
