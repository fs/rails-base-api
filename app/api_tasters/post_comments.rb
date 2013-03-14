ApiTaster::RouteCollector.route do
  desc <<-markdown.strip_heredoc
    ## List comments for a post

    * `:post_id` - post ID
  markdown

  get '/posts/:post_id/comments',
    post_id: Examples.post.id
end
