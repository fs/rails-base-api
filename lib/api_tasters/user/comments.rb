ApiTaster.routes do
  desc '
    ## List comments for currently authenticated user

    * Authenticated as **user** using `authentication_token`
  '.strip_heredoc

  get '/user/comments',
    authentication_token: Examples.user.authentication_token

  desc '
    ## Create comment

    * Authenticated as **user** using `authentication_token`
    * `title` comment title
    * `text` comment text
  '.strip_heredoc

  post '/user/comments',
    FactoryGirl.attributes_for(:comment)
      .merge(authentication_token: Examples.user.authentication_token)
end
