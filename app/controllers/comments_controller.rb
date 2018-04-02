class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only:[:show, :update, :destroy]


  def index
    @comment = @post.comments.order('created_at DESC')
    render json: @comment, status: :ok
  end

  def show
    render json: @comment, status: :ok
  end

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end


  def destroy
    @comment.destroy
    render json: @comment, status: :ok
  end

  def update
    if @comment.update_attributes(comment_params)
      render json: @comment, status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
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
    params.permit(:author, :comment)
  end

end
