BackendBlog::App.controllers :comments, :parent => {:authors => :posts} do

  get :index do
    @post = Post.find(params[:post_id])
    @author = Author.find(params[:author_id])
    @comments = Comment.where("author_id = ?", [@author.id])
    if @comments
      render :index
    else
      flash[:no_comments] = "No comments here yet!"
      redirect url_for(:posts, :show, :author_id => @author.id,
        :id => @post.id)
    end
  end

  get :show, :map => '', :with => :id do
    
    render :show
  end
    
  post :create, :map => ''  do
    
  end

  put :update, :map => '', :with => :id do 

  end

  delete  :delete, :map => '', :with => :id do

  end

end
