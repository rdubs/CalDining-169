class ImagesController < ApplicationController

    def approve
        image = Image.where(id: params[:id]).first
        image.state = 1
        image.save!
        redirect_to :back
    end

    def disapprove
        image = Image.where(id: params[:id]).first
        image.state = 2
        image.save!
        redirect_to :back
    end

end
