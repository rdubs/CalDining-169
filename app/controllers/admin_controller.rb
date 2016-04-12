class AdminController < ApplicationController
    before_action :redirect_non_admin
    # 0 pending, 1 approved, 2 disapproved
    def pending
        @pending_images = Image.where(state: 0)
    end
    
    def disapproved
        @disapproved_images = Image.where(state: 2)
    end
    
    private
        def redirect_non_admin
            if not current_user or not current_user.admin?
                #flash[:notice] = 'MADAFAK'
                redirect_to root_path
            end
        end
end
