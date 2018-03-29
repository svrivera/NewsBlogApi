class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only:[:show, :update, :destroy]


  def index
    @comment = @post.comments.order('created_at DESC')
    render json: {status: 'SUCCESS', message: 'Loaded comments', data: @comment}, status: :ok
  end

  def show
    render json: {status: 'SUCCESS', message: 'Loaded coment', data: @comment}, status: :ok
  end

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      render json: {status: 'SUCCESS', message: 'Created comment', data: @comment}, status: :created
    else
      render json: {status: 'ERROR', message: 'Comment not saved', data: @comment.errors}, status: :unprocessable_entity
    end
  end


  def destroy
    @comment.destroy
    render json: {status: 'SUCCESS', message: 'Comment deleted', data:@comment}, status: :ok
  end

  def update
    if @comment.update_attributes(comment_params)
      render json: {status: 'SUCCESS', message: 'Updated comment', data: @comment}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Comment not updated', data: @comment.errors}, status: :unprocessable_entity
    end
  end


  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.permit(:name, :content)
  end

end
