class Article < ActiveRecord::Base
  has_many :article_lists
  has_many :lists, through: :article_lists
  validates_presence_of :title, :description
  include Crawler
end
