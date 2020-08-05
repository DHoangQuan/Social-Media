class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes

  # Personal 
  has_many :host_users, foreign_key: :relation_id, class_name: 'Friend'
  has_many :hosts, through: :host_users, class_name: 'User'

  # Foreign 
  has_many :relating_users, foreign_key: :host_id, class_name: 'Friend'  
  has_many :relations, through: :relating_users, class_name: 'User'
end
    