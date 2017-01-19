#require '/lib/model/crawler.rb'
class SearchController < ApplicationController
  
  include Crawler
  def search_book
    input = params[:query]

    @book_items = Crawler.start_crawler(input)
    if @book_items
      render partial:'/lists/search_books' #不確instant可不可以傳入partial的partial 
    else
      render status: :not_found, nothing: true 
    end
  end
end