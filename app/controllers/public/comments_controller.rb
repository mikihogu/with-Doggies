class Public::CommentsController < ApplicationController
  before_action :authenticate_member!, except: [:destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.member_id = current_member.id
    @comment.post_id = @post.id
    @comment.save
    @post.create_notification_comment!(current_member, @comment.id) #通知する
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    @comment.post_id = @post.id
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end

end
