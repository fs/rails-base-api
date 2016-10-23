users = FactoryGirl.create_list(:user, 3)
users.each { |u| FactoryGirl.create_list(:todo_item, 3, user: u) }
