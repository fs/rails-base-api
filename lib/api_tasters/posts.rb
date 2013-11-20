ApiTaster.routes do
  desc '
    ## List posts
  '.strip_heredoc

  get '/posts'

  desc '
    ## Show post

    * `:id` - post ID
  '.strip_heredoc

  get '/posts/:id',
    id: Examples.post.id
end
