class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :media
  has_many :comments
  has_many :likes

  accepts_nested_attributes_for :media

  def get_comment
    comments.map{|c| [c.id,c.comment_content]}.to_h
  end

  def self.get_comment_list(post_id)
    Post.find(post_id).comments.map{|cmt| cmt.comment_content}
  end 
end
