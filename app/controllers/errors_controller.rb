class ErrorsController < ApplicationController
    
    def show
        status_code = params[:code] || 500
        case status_code
        when "404"
            @error_message = "The page you searched for doesn't exist!"
        when "403"
            @error_message = "You don't have permission there."
        when "422"
            @error_message = "You don't have permission there."
        else
            @error_message = "Something went wrong."
        end
    end
end