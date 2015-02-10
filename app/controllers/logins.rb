BackendBlog::App.controllers :logins do

  get :login do
    @message = flash[:bad_login]
    render :login
  end

  post :login do
  user = Author.find_by_username(params[:username])
    unless user.nil?
      if params[:password] == user.password
        session[:logged_in] = true
        redirect url_for(:authors, :index)
      end
    end
  flash[:bad_login] = "Bad login."
  redirect url_for(:logins, :login)
  end

  get :signup  do
    @user = Author.new
    render :signup
  end

  post :signup do
    unless Author.find_by_username(params[:author][:username])
      if Author.create(params[:author])
        session[:logged_in] = true
        redirect url_for(:authors, :index)
      end
    end
    flash[:user_exists] = "Username already exists"
    redirect url_for(:logins, :signup)
  end

end
