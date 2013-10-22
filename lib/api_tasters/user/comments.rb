ApiTaster.routes do
  desc <<-markdown.strip_heredoc
    ## List comments for currently authenticated user

    * Authenticated as **user** using `authentication_token`
  markdown

  get '/user/comments',
    authentication_token: Examples.user.authentication_token


  desc <<-markdown.strip_heredoc
    ## Create comment

    * Authenticated as **user** using `authentication_token`
    * `title` comment title
    * `text` comment text
  markdown

  post '/user/comments',
    FactoryGirl.attributes_for(:comment).
      merge({ authentication_token: Examples.user.authentication_token })
end
