@user = User.create(email: "ian@example.com", password: 'testtest', 
        password_confirmation: "testtest" , first_name: "ian", last_name: "test", nick_name: "IanTest")
puts "1 user created"

@user2 = User.create(email: "ian2@example.com", password: 'testtest', 
        password_confirmation: "testtest" , first_name: "ian2", last_name: "test", nick_name: "Ian2Test")
puts "1 user created"

@user3 = User.create(email: "ian3@example.com", password: 'testtest', 
        password_confirmation: "testtest" , first_name: "ian3", last_name: "test", nick_name: "Ian3Test")
puts "1 user created"
=begin
  t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nick_name"
=end