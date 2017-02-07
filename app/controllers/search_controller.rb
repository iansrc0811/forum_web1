#require '/lib/model/crawler.rb'
class SearchController < ApplicationController
  
  include Crawler
  def search_book
    input = params[:query]
    
    @book_items = Crawler.start_crawler(input) 
    
    if @book_items
      #
      @list = List.find(params[:list_id])
      #render template: '/lists/show'
      render partial:'/lists/search_books' 

    else
      render status: :not_found, nothing: true 
    end
  end
end