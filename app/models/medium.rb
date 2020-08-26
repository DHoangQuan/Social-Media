class Medium < ApplicationRecord
    mount_uploader :link_medium, MediaUploader
    belongs_to :post, optional: true
    has_many :comments
    has_many :likes

    def next_media(param_medium_id)
        medium = Medium.find(param_medium_id)
        post = medium.post
        list_media = post.media
        list_media[list_media.index(medium).next]
        if list_media[list_media.index(medium).next].nil?
            list_media[0]
        else
            list_media[list_media.index(medium).next]
        end
    end
    
    def prev_media(param_medium_id)
        medium = Medium.find(param_medium_id)
        post = medium.post
        list_media = post.media.reverse
        if list_media[list_media.index(medium).next].nil?
            list_media[0]
        else
            list_media[list_media.index(medium).next]
        end
    end

    # def next
    #     self.post.media.where("media.id > ?", self.id).first
    # end

    # def previous
    #     self.post.media.where("media.id < ?", self.id).last
    # end
end

