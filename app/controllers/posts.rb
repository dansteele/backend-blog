BackendBlog::App.controllers :posts, :parent => :authors do

  get :index do
    @author = Author.find(params[:author_id])
    @post = Post.new(:author_id => @author.id)
    render :index
  end

  get :show, :map => '', :with => :id do

  end
    
  post :create, :map => ''  do
    @post = Post.create!(params[:post])
    redirect url_for(:posts, :index, :author_id => params[:author_id])
  end

  put :update, :map => '', :with => :id do 

  end

  delete  :delete, :map => '', :with => :id do

  end

end
