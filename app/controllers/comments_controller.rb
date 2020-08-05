class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_post, only: [:create]
  # def index
  #   @comments = Comment.all
  #       @comment = Comment.new
  # end
  # $('#parentComment_<%= @comment.id %>').append("<%=j render 'comments/comment',  comment: @comment %>");
  # $('#parentComment_<%= @comment.parent_comment_id %>').append("<li><%= @comment.comment_content%></li>");
  # $('#parentComment_<%= @comment.parent_comment_id %> ').append("<%=j render 'comments/child_comment', comment: @comment %>");
  def create
    # byebug
    @comment = @post.comments.build(comment_params)
    if @comment.save
      respond_to do |format|
        
        if params[:comment][:parent_comment_id].present?
          
          format.js { render :child_comment}
        else
          format.js
        end
      end
    else
        flash[:alert] = "Check the comment form, something went horribly wrong."
        render root_path
    end
  end

  def destroy 
    @comment.destroy
    respond_to do |format|
        format.html { redirect_to posts_url}
        # format.json { head :no_content }
    end
  end

  private

  def set_post
    @post = Post.find(params[:comment][:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment_content, :post_id, :video_id, :image_id, :user_id, :parent_comment_id)
  end
end