BackendBlog::App.controllers :security do

  get :login do
    render :login
  end

  post :login do
    #Check if in DB
  end

  get :signup  do
    @user = User.new
    render :signup
  end

  post :signup do
    redirect url_for(:authors, :index)
  end

end
