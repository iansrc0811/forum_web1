@user = User.create(email: "ian@example.com", password: 'testtest', 
        password_confirmation: "testtest" , first_name: "ian", last_name: "test", nick_name: "IanTest")
puts "1 user created"

@user2 = User.create(email: "ian2@example.com", password: 'testtest', 
        password_confirmation: "testtest" , first_name: "ian2", last_name: "test", nick_name: "Ian2Test")
puts "1 user created"

@user3 = User.create(email: "ian3@example.com", password: 'testtest', 
        password_confirmation: "testtest" , first_name: "ian3", last_name: "test", nick_name: "Ian3Test")
puts "1 user created"

AdminUser.create(email: "ian_admin@example.com", password: 'testtest', 
        password_confirmation: "testtest" , first_name: "ian", last_name: "admin", nick_name: "IanAdmin")
puts "1 admin has been created"

15.times do |list|
  @list = List.create!(name: "書單 #{list}", description:" Description #{list}", 
    user_id: @user.id)

  20.times do |article|
    @article = Article.create!(title: "書單 #{list} No. #{article} Article of List #{list}")
    @article.lists << @list  # many to many association
  end
end

2.times do |list|
  @list = List.create!(name: "List #{list}", description:" Description #{list}", 
    user_id: @user2.id)

  3.times do |article|
    @article = Article.create!(title: "List #{list} No. #{article} Article of List #{list}")
    @article.lists << @list  # many to many association
  end
end
puts "Lists and Articles created"