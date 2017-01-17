require 'rubygems'
require 'nokogiri'
require 'mechanize'
require 'open-uri'
module Crawler

  def self.get_book_names(book_name)
    book_item = start_crawler(book_name)
    book_names = []
    book_item.each do |name|
      book_names.push(name['title'])
      #http://stackoverflow.com/questions/21856799/nokogiri-mechanize-css-selector-by-text
      #[name*="value"] - Selects elements that have the specified attribute with a value containing the a given substring.
    end

    return book_names
  end #end get_book_list

  def self.get_book_links(book_name)
    book_item = self.start_crawler(book_name)
    book_links = []
    book_item.each do |name|
      book_links.push(name['href'])
    end
    return book_links
  end


  def self.get_book_image(book_name)
    
   current_url = #page.uri.to_s 
"http://search.books.com.tw/search/query/key/"+book_name+"/cat/all"
    page = Nokogiri::HTML(open(current_url))
    image_links = []
    page.css('.item').each do |img_links|
      img = img_links.at_css('.itemcov')['data-original'].split('&')[0]
      #找到class='itemcov' (img tag) 裡的'data-original'attribute的值，就是圖片網址
      #然後以'&'字元分割字串，可以取到完整的大圖，不然原本'&'後接的是調整大小的值
      image_links.push(img)
    end
    return image_links
  end

  def self.start_crawler(book_name)

    agent = Mechanize.new 
    books_url = "http://www.books.com.tw/"
    page = agent.get(books_url)

    books_form = page.form('search') #找到名為'search'的form
    books_form.key = book_name # form的輸入欄位名為'key', 填入輸入的book name

    page = agent.submit(books_form) #送出form (進入搜尋)
    current_url = page.uri.to_s  #取得搜尋結果的網址

    page = Nokogiri::HTML(open(current_url)) 
    book_list = []
    book_item = page.xpath("//li[@class='item']/a[@rel='mid_image']") #找到 li.item裡的a tag，a tag的 rel 為 'mig_image'


    return book_item #此物件包含書名和連結
  end


end