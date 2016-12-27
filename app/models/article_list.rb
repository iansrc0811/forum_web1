class ArticleList < ActiveRecord::Base
  belongs_to :list
  belongs_to :article
end
