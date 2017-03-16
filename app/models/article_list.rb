class ArticleList < ActiveRecord::Base
  belongs_to :list
  belongs_to :article

  def self.repeat?(article, list)
    where(article_id: article.id, list_id: list.id).any?
  end

  def self.find_for_destroy(article_id, list_id)
    where(article_id: article_id, list_id: list_id).first
  end 
end
