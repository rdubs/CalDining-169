class AdminController < ApplicationController
    before_action :redirect_non_admin
    
    def pending
    end
    
    def disapproved
    end
    
    private
        def redirect_non_admin
            if not current_user.admin?
                #flash[:notice] = 'MADAFAK'
                redirect_to root_path
            end
        end
end
