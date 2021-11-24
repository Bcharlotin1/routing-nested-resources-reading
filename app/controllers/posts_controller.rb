class PostsController < ApplicationController

  def index
    if params[:author_id]
      #params[:author_id] coming from? Rails provides it for us through the nested route,
      #The conditional hinges on whether there's an :author_id key in the params hash — in other words, whether the user navigated to /authors/:id/posts 
      @posts = Author.find(params[:author_id]).posts
      #accccounts for the new nest urls, so see if the user is tryting to access all pots or all post form a particular author
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
  end 

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to post_path(@post)
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end

private

  def post_params
    params.require(:post).permit(:title, :desription, :post_status, :author_id)
  end
end
