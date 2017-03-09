class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index

  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: "Your post was cretaed succesfully "
    else
      render :new
    end
  end

  def show

  end

  private

    def post_params
      params.require(:post).permit(:date, :rationale)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
