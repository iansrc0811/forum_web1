class List < ActiveRecord::Base
  belongs_to :user
  has_many :article_lists
  has_many :articles, through: :article_lists
  validates_presence_of :name
  
  
end

