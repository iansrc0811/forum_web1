# 書單分享

#### 結構 
* User  model
* List model
* Article model (book)
* (待完成) Description

#### association
* User -> List (one-to-many)
* List -> ArticleList(middle table) -> Article (many-to-many)
* Article -> Description (one-to-many)

#### 使用
* 基本的註冊、登入、登出功能
* User 可以建立書單(List)，在自己的list中可以搜尋或新增商品
* 使用爬蟲爬[博客來](http://www.books.com.tw/) 上User輸入的關鍵字，列出搜尋結果。
* 選取搜尋結果欲加入書單的書

#### 待完成未完成
* 未登入的使用者可以建立一個臨時清單，登入後可以馬上存成自己的清單
* 再增加一個description(書評) table
* 可以為清單中的書加入評語或心得分享
* 完成後的清單可以分享給別人，或是直接加入博客來購物車。
* 可以匯入別人的清單到自己的頁面。
* 社群帳號登入
* 將爬蟲包成一個gem
* 清單權限設置功能(目前都為公開)
* 將爬到的資料包裝更好一點(JSON)
