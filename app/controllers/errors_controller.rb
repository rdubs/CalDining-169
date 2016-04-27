class ErrorsController < ApplicationController
    
    def show
        status_code = params[:code] || 500
        @error_body = "Please double-check the address you typed in."
        case status_code
        when "404"
            @error_message = "The page you searched for doesn't exist!"
        when "403"
            @error_message = "You don't have permission for that."
        when "422"
            @error_message = "You don't have permission for that."
        else
            @error_body = ''
            @error_message = "Something went wrong with the Cal Dining server."
        end
    end
end