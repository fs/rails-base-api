ApiTaster.routes do
  desc <<-markdown.strip_heredoc
    ## List posts
  markdown

  get '/posts'

  desc <<-markdown.strip_heredoc
    ## Show post

    * `:id` - post ID
  markdown

  get '/posts/:id',
    id: Examples.post.id
end
