class Public::PostsController < ApplicationController
  def new
    @post = Post.new
    @posts = Post.all
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save(post_params)
      redirect_to post_path(@post)
    else
      render :new
    end   
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end


  private
  def post_params
    params.require(:post).permit(:name, :introduction, :information, :post_image, :category, tag, :prefecture, :address)
  end

end
