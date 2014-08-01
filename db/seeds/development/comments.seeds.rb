user = User.first || FactoryGirl.create(:user)
post = Post.first || FactoryGirl.create(:post)

FactoryGirl.create_list :comment, 2, post: post, user: user
