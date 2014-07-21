user = FactoryGirl.create :user
posts = FactoryGirl.create_list :post, 5
post = posts.first
comments = FactoryGirl.create_list :comment, 2, post: post, user: user
