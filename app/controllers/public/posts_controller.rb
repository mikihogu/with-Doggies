class Public::PostsController < ApplicationController
  def new
    @post = Post.new
    @posts = Post.all
    @categories = Category.all
    @tags = Tag.all
  end

  def create
    @categories = Category.all
    @tags = Tag.all
    @post = Post.new(post_params)
    @post.latitude = params[:post][:latitude]
    @post.longitude = params[:post][:longitude]
    @post.member_id = current_member.id
    @post.tags = Tag.where(id: params[:post][:tag_ids])
    if @post.save
      redirect_to post_path(@post), notice: "You've saccessfully posted."
    else
      flash.now[:alert] = 'There was something wrong.'
      render :new
    end
  end

  def index
    @categories = Category.all
    @posts = Post.all.order(created_at: :desc)
    if params[:category]
      @category = Category.find_by(name: params[:category])
      @posts = @category.posts.order(created_at: :desc)
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    # @comments = @post.comments.all
  end

  def edit
    @post = Post.find(params[:id])
    @categories = Category.all
    @tags = Tag.all
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end


  private
  def post_params
    params.require(:post).permit(
      :name, :introduction, :information, :post_image,
      :category_id,
      :prefecture, :address, :latitude, :longitude, tag_ids: []
    )
  end

end
