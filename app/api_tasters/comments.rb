ApiTaster::RouteCollector.route do
  desc <<-markdown.strip_heredoc
    ## List comments
  markdown

  get '/comments'


  desc <<-markdown.strip_heredoc
    ## Show comment

    * `:id` - post ID
  markdown

  get '/comments/:id',
    id: Examples.comment.id
end
