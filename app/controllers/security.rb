BackendBlog::App.controllers :security do

  get :login do
    render :login
  end

  post :login do
  user = User.find_by_username(params[:username])
    unless user.nil?
      if params[:password] == user.password
        session[:logged_in] = true
        redirect url_for(:people, :all)
      end
    end
  flash[:bad_login] = "Bad login."
  redirect url_for(:people, :login)
  end

  get :signup  do
    @user = User.new
    render :signup
  end

  post :signup do
    redirect url_for(:authors, :index)
  end

end
