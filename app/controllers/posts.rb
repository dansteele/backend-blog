BackendBlog::App.controllers :posts, :parent => :authors do

  get :index do
    @author = Author.find(params[:author_id])
    @posts = @author.posts
    unless @posts.length > 0
      flash[:error] = "Author has no posts yet."
      redirect url_for(:authors, :show, :id => @author.id)
    end
    @post = Post.new(:author_id => @author.id)
    @message = flash[:no_comments]
    render :index
  end

  get :show, :map => '', :with => :id do
    @author = Author.find(params[:author_id])
    @post = Post.find(params[:id])
    @posts = @author.posts
    render :show
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
