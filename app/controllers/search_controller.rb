#require '/lib/model/crawler.rb'
class SearchController < ApplicationController
  
  include Crawler
  def search_book
    input = params[:query]
    
    @book_items = Crawler.start_crawler(input) 
    
    if @book_items
      render partial:'/lists/search_books' 
    else
      render status: :not_found, nothing: true 
    end
  end
end