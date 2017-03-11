require 'rubygems'
require 'nokogiri'
require 'mechanize'
require 'open-uri'
require 'addressable/uri'
module Crawler
 
  def self.start_crawler(search_content)

    unless search_content.match(/^http:\/{2}www.books.com.tw\/products\//)
      agent = Mechanize.new 
      books_url = "http://www.books.com.tw/"
      page = agent.get(books_url)

      books_form = page.form('search') #找到名為'search'的form
      books_form.key = search_content # form的輸入欄位名為'key', 填入輸入的book name

      page = agent.submit(books_form) #送出form (進入搜尋)
      current_url = page.uri.to_s  #取得搜尋結果的網址
  # "http://search.books.com.tw/search/query/key/"+search_content+"/cat/all"
      page = Nokogiri::HTML(open(current_url))

      book_names = []
      book_links = []
      book_images = []

      book_item = [book_names, book_links, book_images]

      page.css('.item').each do |item|
        img = item.at_css('.itemcov')['data-original'].split('&')[0]
        #找到class='itemcov' (img tag) 裡的'data-original'attribute的值，就是圖片網址
        #然後以'&'字元分割字串，可以取到完整的大圖，不然原本'&'後接的是調整大小的值
        book_images.push(img) 
        item_name = item.at_css('a')['title'] #找到a tag裡的title屬性的值 (書名)
        book_names.push(item_name)

        book_link = item.at_css('a')['href'] #找到 a tag 裡的href屬性的值 (link)
        book_links.push(book_link)
        
      end

      return book_item

    else
      page = Nokogiri::HTML(open(search_content))

      #記得改成JSON啊啊啊啊啊啊啊啊啊啊
      book_names = []
      book_links = []
      book_images = []

      book_item = [book_names, book_links, book_images]

      item_node = page.css('.looks + img')
      book_names << item_node.attr('alt').value
      book_images <<item_node.attr('src').value.split('&')[0]
      book_links << search_content
      return book_item

    end
  end # end of 


end