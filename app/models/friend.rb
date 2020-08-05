class Friend < ApplicationRecord
    # belongs_to :follower, class_name: 'User'
    # belongs_to :followee, class_name: 'User'

    belongs_to :host, class_name: 'User'
    belongs_to :relation, class_name: 'User'
end
