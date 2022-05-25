class PostsController < ApplicationController

    def index
        posts = Post.all
        render json: posts
    end

    def show
        post = Post.find(params[:id])
        render json: post
    end

    def create
        post = Post.create(post_params)

        if post.valid?
            render json: post
        else 
            render json: post.errors, status:422
        end
    end

    def update
        post = Post.find(params[:id])
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
