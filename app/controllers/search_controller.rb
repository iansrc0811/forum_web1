#require '/lib/model/crawler.rb'
class SearchController < ApplicationController
  
  include Crawler
  def search_book
    input = params[:query]

    @book_names = Crawler.get_book_names(input)
    @book_links = Crawler.get_book_links(input)
    @book_images = Crawler.get_book_image(input)
    render '/search/show_result'
  end
end