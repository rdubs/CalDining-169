class ImagesController < ApplicationController
    def approve
        set_state(1, params[:id])
    end

    def disapprove
        set_state(2, params[:id])
    end
    
    def set_state(state, id)
        image = Image.where(id: id).first
        image.state = state
        image.save!
        redirect_to :back
    end
end
