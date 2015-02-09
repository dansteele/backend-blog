BackendBlog::App.controllers :authors do

  get :index do
    @posts = Author.all
    render :index
  end

  get :show, :map => '', :with => :id do

  end
    
  post :create, :map => ''  do

  end

  put :update, :map => '', :with => :id do 

  end

  delete  :delete, :map => '', :with => :id do

  end

end
