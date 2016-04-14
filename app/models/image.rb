class Image < ActiveRecord::Base
    belongs_to :user
    belongs_to :item

    def self.get_first_image(item)
        first_image = item.images.where(state: 1).first
        if first_image
            return first_image.filename
        else
            return 'http://www.ourhometravel.com/images/NoImageAvailable.png'
        end
    end
end
