class Comment < ApplicationRecord
  belongs_to :medium, optional: true
  belongs_to :post, optional: true
  belongs_to :user, optional: true

  belongs_to :parent, :class_name => "Comment", :foreign_key => "parent_comment_id", optional: true
  has_many :child_comments, :class_name => "Comment", :foreign_key => "parent_comment_id"

  has_many :likes
end