class MediaController < ApplicationController
  before_action :set_medium, only: [:show, :edit, :update, :destroy]
  
  def show    
    respond_to do |format|
      # byebug
      format.js
    end
  end

  private

  def set_medium
    @medium = Medium.find(params[:id])
  end

end