require 'rubygems'
require 'nokogiri'
require 'mechanize'
require 'open-uri'

module Crawler

  def get_book_names(book_name)
    book_item = self.start_crawler(book_name)
    book_names = []
    book_item.each do |name|
      book_names.push(name['title'])
    end

    return book_names
  end #end get_book_list

  def get_book_links(book_name)
    book_item = self.start_crawler(book_name)
    book_links = []
    book_item.each do |name|
      book_links.push(name['href'])
    end

    return book_links

  end

  
  def start_crawler(book_name)
    agent = Mechanize.new 
    books_url = "http://www.books.com.tw/"
    page = agent.get(books_url)

    books_foagent = Mechanize.new
    books_form = page.form('search')
    books_form.key = book_name

    page = agent.submit(books_form)
    current_url = page.uri.to_s 

    page = Nokogiri::HTML(open(current_url))
    book_list = []
    book_item = page.xpath("//li[@class='item']/a[@rel='mid_image']")
    return book_item
  end
end