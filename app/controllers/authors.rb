BackendBlog::App.controllers :authors do

  get :index do
    @authors = Author.all
    render :index
  end

  get :show, :map => '', :with => :id do
    @author = Author.find(params[:id])
    @posts = @author.posts
    render :post_list
  end
    
  post :create, :map => ''  do

  end

  put :update, :map => '', :with => :id do 

  end

  delete  :delete, :map => '', :with => :id do

  end

end
