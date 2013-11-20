ApiTaster.routes do
  desc '
    ## Visitor signs in
  '.strip_heredoc

  post '/users/sign_in', user: {
    email: Examples.user.email,
    password: Examples.password
  }
end
