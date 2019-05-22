module SpecTestHelper   
  def current_user
    User.find(request.session[:user])
  end

  def login_as(user)
    request.session[:user_id] = user.id
  end
end
