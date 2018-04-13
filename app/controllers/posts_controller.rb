class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_admin!, except: [ :index, :show]

  # Index action to render all posts
  def index
    if params[:category]
      @posts = Post.all.where(category: params[:category]).reverse_order
    else
      @posts = Post.all.reverse_order
    end
    # @posts = Post.all.reverse_order
    @subscriber = Subscriber.new
  end

  # def parier
  #   @posts = Post.all.where
  # end

  # New action for creating post
  def new
    @post = Post.new
  end

  # Create action saves the post into database
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Successfully created post!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Error creating new post!"
      render :new
    end
  end

  # Edit action retrives the post and renders the edit page
  def edit
  end

  # Update action updates the post with the new information
  def update
    if @post.update_attributes(post_params)
      flash[:notice] = "Successfully updated post!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Error updating post!"
      render :edit
    end
  end

  # The show action renders the individual post after retrieving the the id
  def show
    @subscriber = Subscriber.new
  end

  # The destroy action removes the post permanently from the database
  def destroy
    if @post.delete
      flash[:notice] = "Successfully deleted post!"
      redirect_to posts_path
    else
      flash[:alert] = "Error updating post!"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :category)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
