ApiTaster::RouteCollector.route do
  desc <<-markdown.strip_heredoc
    ## List comments for currently authenticated user

    * Authenticated as **user** using `authentication_token`
  markdown

  get '/user/comments',
    authentication_token: Examples.user.authentication_token
end
