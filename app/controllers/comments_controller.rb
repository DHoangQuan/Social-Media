class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_post, only: [:create]
  

  def create
    # byebug
    @comment = @post.comments.build(comment_params)
    if @comment.save

      respond_to do |format|
          if params[:comment][:parent_comment_id].present?
            format.js { render :child_comment}

          elsif params[:comment][:medium_id].present?
            format.js { render :comment_media}
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
    # byebug
    if params[:post_id].present?
      @post = Post.find(params[:post_id])
    else
    @post = Post.find(params[:comment][:post_id])
    end
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
      params.require(:comment).permit(:comment_content, :post_id, :medium_id, :user_id, :parent_comment_id)
  end
end