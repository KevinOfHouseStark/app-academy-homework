class PostsController < ApplicationController

  before_action :ensure_logged_in, only: [:new, :create, :edit, :update]
  before_action :ensure_post_ownership, only: [:edit, :update]

  def new
    @post = Post.new
    render :new
  end

  def show
    @post = Post.find_by(id: params[:id])
    render :show
  end

  def create
    @post = Post.new(post_params)
    @post.sub_id = params[:sub_id]
    @post.author_id = current_user.id
    
    if @post.save
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to sub_url(@post.sub)
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content)
  end
end
