class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    def index
        # byebug
        if session[:user_id].nil?
            respond_to do |format|
                format.html { render "sessions/new", :layout => false }
            end
        else
        # @posts = Post.all.order("created_at DESC")
        @posts = Post.all
        @post = Post.new
        @medium = @post.media.build
        @comments = Comment.all
        @comment = Comment.new
        end
    end

    def create
        # byebug
        @post = Post.new(post_params)
        @post.save
        @comments = Comment.all
        @comment = Comment.new

        respond_to do |format|
            if params[:media].present?
                params[:media]['link_medium'].each do |a|
                    @medium = @post.media.create!(:link_medium => a)
                end
            end
            format.js { render :show }
        end
    end

    def destroy
        @post.destroy
        respond_to do |format|
            format.html { redirect_to posts_url}
            format.json { head :no_content }
            format.js { render :show }
        end
    end
    

    private
    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:content, :status, :user_id)
    end
    # def post_params
    #     params.require(:post).permit(:content, :status, :user_id, media_attributes: [:id, :link_medium, :description, :post_id])
    # end
end