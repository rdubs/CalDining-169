class AdminController < ApplicationController
    before_action :redirect_non_admin
    # 0 pending, 1 approved, 2 disapproved
    @pending = 0
    @approved = 1
    @disapproved = 2
    def pending
        @pending_images = Image.where(state=@pending)
    end
    
    def disapproved
        @disapproved_images = Image.where(state=@disapproved)
    end
    
    private
        def redirect_non_admin
            if not current_user or not current_user.admin?
                #flash[:notice] = 'MADAFAK'
                redirect_to root_path
            end
        end
end
