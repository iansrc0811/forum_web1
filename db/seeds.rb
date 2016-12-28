@user = User.create(email: "ian@example.com", password: 'testtest', 
        password_confirmation: "testtest" , first_name: "ian", last_name: "test", nick_name: "IanTest")
puts "1 user created"

AdminUser.create(email: "ian_admin@example.com", password: 'testtest', 
        password_confirmation: "testtest" , first_name: "ian", last_name: "admin", nick_name: "IanAdmin")
puts "1 admin user created"

15.times do |list|
  @list = List.create!(name: "List #{list}", description:" Description #{list}", 
    user_id: @user.id)

  20.times do |article|
    @article = Article.create!(title: "List #{list} No. #{article} Article of List #{list}", description: "No.#{article} Description of List #{list}")
    @article.lists << @list  # many to many association
  end
end

puts "Lists and Articles created"