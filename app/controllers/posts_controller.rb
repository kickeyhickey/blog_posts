class PostsController < ApplicationController

    def index
        @posts = Post.all
    end


    def new
        @post = Post.new
    end

    def show
        @post = Post.find(params[:id])
x    end

    def create
        @post = Post.create(post_params)

        if @post.save?
            redirect_to @post
        else 
            render 'new'
        end
    end

    def update
        @post = Post.find(params[:id])
        post.update(post_params)

        if post.valid?
            render json: post
        else
            render json: post.errors, status:422
        end
    end

    def destroy
        post = Post.find(params[:id])
        post.destroy
        render json: post
    end


    private
    def post_params
        params.require(:post).permit(:title, :content)
    end

end
