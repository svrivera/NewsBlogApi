class PostsController < ApplicationController
  before_action :set_post, except:[:index, :create]

  def index
    @posts = Post.order('created_at DESC');
    render json: @posts, each_serializer: PostSerializer, status: :ok
  end

  def show
    render json: @post, status: :ok
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post, status: :created
    else
      render json:  @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    render json: @post, status: :ok
  end

  def update
    if @post.update_attributes(post_params)
      render json: @post, status: :ok
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.permit(:title, :subtitle, :body)
  end

end
