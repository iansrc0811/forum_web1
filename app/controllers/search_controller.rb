#require '/lib/model/crawler.rb'
class SearchController < ApplicationController
  
  include Crawler
  def search_book
    input = params[:query]
    
    @book_items = Crawler.start_crawler(input) 
    
    if @book_items

      render '/lists/show'

    else
      render status: :not_found, nothing: true 
    end
  end
end