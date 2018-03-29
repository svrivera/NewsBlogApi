class PostsController < ApplicationController
  before_action :set_post, except:[:index, :create]

  def index
    @posts = Post.order('created_at DESC');
    render json: {status: 'SUCCESS', message: 'Loaded posts', data: @posts}, status: :ok
  end

  def show
    render json: {status: 'SUCCESS', message: 'Loaded posts', data: @post}, status: :ok
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: {status: 'SUCCESS', message: 'Loaded posts', data: @post}, status: :created
    else
      render json: {status: 'ERROR', message: 'Post not saved', data: @post.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    render json: {status: 'SUCCESS', message: 'Post deleted', data:@post}, status: :ok
  end

  def update
    if @post.update_attributes(post_params)
      render json: {status: 'SUCCESS', message: 'Updated post', data: @post}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Post not updated', data: @post.errors}, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.permit(:title, :downtitle, :body)
  end

end
