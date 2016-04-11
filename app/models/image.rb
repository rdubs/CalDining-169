class Image < ActiveRecord::Base
    belongs_to :user
    belongs_to :item

    def self.get_first_image(item)
        first_image = item.images.first
        if first_image
            return "app/user_uploads/#{first_image.filename}"
        else
            return "public/No_image_available.jpg"
        end
    end
end
