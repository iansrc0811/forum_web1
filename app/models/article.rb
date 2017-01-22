class Article < ActiveRecord::Base
  has_many :article_lists
  has_many :lists, through: :article_lists

  validates :title, presence: true, 
  uniqueness: { case_sensitive: false }
  
  def self.find_by_name(item_name)
    where(title: item_name).first
  end
  def self.new_by_search(item_name, item_link, item_image)
    new_item = new(title: item_name, link: item_link, image: item_image)
  end

end
