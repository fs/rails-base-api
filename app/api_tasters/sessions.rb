ApiTaster::RouteCollector.route do
  desc <<-markdown.strip_heredoc
    ## Visitor signs in
  markdown

  post '/users/sign_in', user: {
    :email => Examples.user.email,
    :password => Examples.password
  }
end
