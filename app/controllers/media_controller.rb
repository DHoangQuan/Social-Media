class MediaController < ApplicationController
  before_action :set_medium, only: [:show, :edit, :update, :destroy, :next_medium, :prev_medium]
  
  def show    
    # byebug
    @post = Post.new
    @medium = @post.media.build
    @medium_detail = Medium.find(params[:id])
    respond_to do |format|
      # format.js
      format.html
    end
  end

  def next_medium
    # byebug
    aa = Medium.new
    @new_medium = aa.next_media(@medium.id)
    # @new_medium = @medium.next_media
    respond_to do |format|
      format.js { render :new_medium }
    end
  end

  def prev_medium
    # byebug
    qq = Medium.new
    @new_medium = qq.prev_media(@medium.id)
    respond_to do |format|
      format.js { render :new_medium }
    end
  end

  private

  def set_medium
    # byebug
    @medium = Medium.find(params[:id])
  end

end